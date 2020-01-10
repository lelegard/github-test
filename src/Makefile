default: apps

SYST := $(shell uname -s | tr A-Z a-z)
ARCH := $(shell uname -m)

ifeq ($(SYST),darwin)
    LDFLAGS += -Wl,-rpath,@executable_path
    SOFLAGS += -install_name '@rpath/$(notdir $@)'
else
    LDFLAGS += -Wl,-rpath,'$$ORIGIN'
    SOFLAGS = -Wl,-soname=$(notdir $@)
endif
CXXFLAGS += -fPIC
OBJDIR = Release-$(ARCH)

$(OBJDIR)/%.o: %.cpp
	mkdir -p $(OBJDIR); \
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c -o $@ $<
$(OBJDIR)/%: $(OBJDIR)/%.o
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@
$(OBJDIR)/%.so: $(OBJDIR)/%.o
	$(CXX) $(CFLAGS) $(SOFLAGS) $(LDFLAGS) $^ $(LDLIBS) -shared -o $@
clean:
	rm -rf *.o *.a *.exe core core.* [Dd]ebug* [Rr]elease* ipch *.exe *.so .vs *.vcxproj.user

apps: $(OBJDIR)/app $(OBJDIR)/app_dll
$(OBJDIR)/app_dll: $(OBJDIR)/dll.so

test: apps
	$(OBJDIR)/app
	$(OBJDIR)/app_dll
