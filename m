Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E41AC7EE24
	for <soc@archiver.kernel.org>; Mon, 15 May 2023 19:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C709C433D2; Mon, 15 May 2023 19:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226C4C433EF;
	Mon, 15 May 2023 19:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684178438;
	bh=ah0GhFaEDb1S0PfDMXBqZKe8kiX6OrKjj05ZYFcnu0M=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=q7EKcFw5yP34tcMDM+u68s3xK1H4MlsEU7MzmBVynRae/SnjQjo8P2k3TT2muMqDG
	 zuHSebFp9cgeSKhABOA6UzF9fowBhOseM2ia8yvyzwgcC3bVj4XTywHqhWBtzhOFsa
	 WTccoDFLFeEaGwcFIbyzzijtzIauLDzF5y/DozwDzWsoeYJh5WkQe0n/yIhdqunS8J
	 wmN2dIz45mlIFBjqz8FUlgpue0vQAQoIPCO2yBxlI4fdGabLKepZZOjilLtfWgdKki
	 wVnRQLrpEkbz8u7hyeBxrQzLpDSArm9lZIQlmhcj9YnbhVkdJlVk7xcXwsyzDI/NR3
	 Dxo4dYM2yOgvA==
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Olof Johansson <olof@lixom.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] Documentation/process: add soc maintainer handbook
Date: Mon, 15 May 2023 20:20:02 +0100
Message-Id: <20230515-geometry-olympics-b0556ff8a5f7@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11747; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=c9tqcCRq7TUwJsFDAzuIJiCFpaRA/Poh6Kt7zhcgk8Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClJrQ8N12Zp/k8Lf5Ui5uzI4vhu1fqX007xTRV8HxHaE ptiP4+zo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPhXsrIcF584yInv3eh5RIC 0g1Cc0915N10N7UTN1qzbWrwc/8t5xj+ysxR2Gfxadna/qN3fO9wJMgnSnr7TKmfcN+3enrg+UN mrAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Arnd suggested that adding maintainer handbook for the SoC "subsystem"
would be helpful in trying to bring on board maintainers for the various
new platforms cropping up in RISC-V land.

Add a document briefly describing the role of the SoC subsystem and some
basic advice for (new) platform maintainers.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Olof Johansson <olof@lixom.net>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: soc@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-riscv@lists.infradead.org
---
 .../devicetree/bindings/writing-schema.rst    |   2 +
 .../process/maintainer-handbooks.rst          |   3 +-
 Documentation/process/maintainer-soc.rst      | 181 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 4 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/process/maintainer-soc.rst

diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
index 4a381d20f2b4..640d857dabf3 100644
--- a/Documentation/devicetree/bindings/writing-schema.rst
+++ b/Documentation/devicetree/bindings/writing-schema.rst
@@ -136,6 +136,8 @@ installed. Ensure they are in your PATH (~/.local/bin by default).
 
 Recommended is also to install yamllint (used by dtschema when present).
 
+.. _running-checks:
+
 Running checks
 ~~~~~~~~~~~~~~
 
diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index d783060b4cc6..fe24cb665fb7 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -15,5 +15,6 @@ Contents:
    :numbered:
    :maxdepth: 2
 
-   maintainer-tip
    maintainer-netdev
+   maintainer-soc
+   maintainer-tip
diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
new file mode 100644
index 000000000000..4289aa1dadd4
--- /dev/null
+++ b/Documentation/process/maintainer-soc.rst
@@ -0,0 +1,181 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _maintainer-soc:
+
+=============
+SoC Subsystem
+=============
+
+Overview
+--------
+
+The SoC subsystem is a place of aggregation for SoC-specific code.
+The main components of the subsystem are:
+
+* devicetrees for 32- & 64-bit ARM and RISC-V
+* 32-bit ARM board files (arch/arm/mach*)
+* 32- & 64-bit ARM defconfigs
+* SoC specific drivers across architectures, in particular for 32- & 64-bit
+  ARM, RISC-V and Loongarch
+
+These "SoC specific drivers" do not include clock, GPIO etc drivers that have
+other top-level maintainers. The drivers/soc/ directory is generally meant
+for kernel-internal drivers that are used by other drivers to provide SoC
+specific functionality like identifying a SoC revision or interfacing with
+power domains.
+
+The SoC subsystem also serves as an intermediate location for changes to
+drivers/bus, drivers/firmware, drivers/reset and drivers/memory.  The addition
+of new platforms, or the removal of existing ones, often go through the SoC
+tree as a dedicated branch covering multiple subsystems.
+
+The main SoC tree is housed on git.kernel.org:
+  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/
+
+Clearly this is quite a wide range of topics, which no one person, or even
+small group of people are capable of maintaining.  Instead, the SoC subsystem
+is comprised of many submaintainers, each taking care of individual platforms
+and driver sub-directories.
+In this regard, "platform" usually refers to a series of SoCs from a given
+vendor, for example, Nvidia's series Tegra SoCs.  Many submaintainers operate
+on a vendor level, responsible for multiple product lines.  For several reasons,
+including acquisitions/different business units in a company, things vary
+significantly here.  The various submaintainers are documented in the
+MAINTAINERS file.
+
+Most of these submaintainers have their own trees where they stage patches,
+sending pull requests to the main SoC tree.  These trees are usually, but not
+always, listed in MAINTAINERS.  The main SoC maintainers can be reached via the
+alias soc@kernel.org if there is no platform-specific maintainer, or if they
+are unresponsive.
+
+What the SoC tree is not, however, is a location for architecture specific code
+changes.  Each architecture has it's own maintainers that are responsible for
+architectural details, cpu errata and the like.
+
+Information for (new) Sub-maintainers
+-------------------------------------
+
+As new platforms spring up, they often bring with them new submaintainers,
+many of whom work for the silicon vendor, and may not be familiar with the
+process.
+
+devicetree ABI stability
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Perhaps one of the most important things to highlight is that dt-bindings
+document the ABI between the devicetree and the kernel.  Once dt-bindings have
+been merged (and appear in a release of the kernel) they are set in stone, and
+any changes made must be compatible with existing devicetrees.  This means that,
+when changing properties, a "new" kernel must still be able to handle an old
+devicetree.  For many systems the devicetree is provided by firmware, and
+upgrading to a newer kernel cannot cause regressions.  Ideally, the inverse is
+also true, and a new devicetree will also be compatible with an old kernel,
+although this is often not possible.
+
+If changes are being made to a devicetree that are incompatible with old
+kernels, the devicetree patch should not be applied until the driver is, or an
+appropriate time later.  Most importantly, any incompatible changes should be
+clearly pointed out in the patch description and pull request, along with the
+expected impact on existing users.
+
+Driver branch dependencies
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A common problem is synchronizing changes between device drivers and devicetree
+files, even if a change is compatible in both directions, this may require
+coordinating how the changes get merged through different maintainer trees.
+
+Usually the branch that includes a driver change will also include the
+corresponding change to the devicetree binding description, to ensure they are
+in fact compatible.  This means that the devicetree branch can end up causing
+warnings in the "make dtbs_check" step.  If a devicetree change depends on
+missing additions to a header file in include/dt-bindings/, it will fail the
+"make dtbs" step and not get merged.
+
+There are multiple ways to deal with this:
+
+ - Avoid defining custom macros in include/dt-bindings/ for hardware constants
+   that can be derived from a datasheet -- binding macros in header file should
+   only be used as a last resort if there is no natural way to define a binding
+
+ - Use literal values in the devicetree file in place of macros even when a
+   header is required, and change them to the named representation in a
+   following release
+
+ - Defer the devicetree changes to a release after the binding and driver have
+   already been merged
+
+ - Change the bindings in a shared immutable branch that is used as the base for
+   both the driver change and the devicetree changes
+
+devicetree naming convention
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The general naming scheme for devicetree files are as follows.  The aspects of a
+platform that are set at the SoC level, like cpu cores, are contained in a file
+named $soc.dtsi, for example, jh7100.dtsi.  Integration details, that will vary
+from board to board, are described in $soc-$board.dtsi.  An example of this is
+jh7100-beaglev-starlight.dts.  Often many boards are variations on a theme, and
+frequently there are intermediate files, such as jh7100-common.dtsi, which sit
+between the $soc.dtsi and $soc-$board.dts files, containing the descriptions of
+common hardware.
+
+Some platforms also have System on Modules, containing an SoC, which are then
+integrated into several different boards. For these platforms, $soc-$som.dtsi
+and $soc-$som-$board.dts are typical.
+
+Directories are usually named after the vendor of the SoC at the time of it's
+inclusion, leading to some historical directory names in the tree.
+
+dtbs_check
+~~~~~~~~~~
+
+``make dtbs_check`` can be used to validate that devicetree files are compliant
+with the dt-bindings that describe the ABI.  Please see :ref:`running-checks`
+for more information on the validation of devicetrees.
+
+For new platforms, or additions to existing ones, ``make dtbs_check`` should not
+add any new warnings.  For RISC-V, as it has the advantage of being a newer
+architecture, ``make dtbs_check W=1`` is required to not add any new warnings.
+If in any doubt about a devicetree change, reach out to the devicetree
+maintainers.
+
+
+Branches and Pull Requests
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Just as the main SoC tree has several branches, it is expected that
+submaintainers will do the same. Driver, defconfig and devicetree changes should
+all be split into separate branches and appear in separate pull requests to the
+SoC maintainers.  Each branch should be usable by itself and avoid
+regressions that originate from dependencies on other branches.
+
+Small sets of patches can also be sent as separate emails to soc@kernel.org,
+grouped into the same categories.
+
+If changes do not fit into the normal patterns, there can be additional
+top-level branches, e.g. for a treewide rework, or the addition of new SoC
+platforms including dts files and drivers.
+
+Branches with a lot of changes can benefit from getting split up into separate
+topics branches, even if they end up getting merged into the same branch of the
+SoC tree.  An example here would be one branch for devicetree warning fixes, one
+for a rework and one for newly added boards.
+
+Another common way to split up changes is to send an early pull request with the
+majority of the changes at some point between rc1 and rc4, following up with one
+or more smaller pull requests towards the end of the cycle that can add late
+changes or address problems idenfied while testing the first set.
+
+While there is no cut-off time for late pull requests, it helps to only send
+small branches as time gets closer to the merge window.
+
+Pull requests for bugfixes for the current release can be sent at any time, but
+again having multiple smaller branches is better than trying to combine too many
+patches into one pull request.
+
+The subject line of a pull request should begin with "[GIT PULL]" and made using
+a tag, rather than a branch.  This tag should contain a short description
+summarising the changes in the pull request.  For more detail on sending pull
+requests, please see :ref:`pullrequests`.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..29631c325857 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1815,6 +1815,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
+F:	Documentation/process/maintainer-soc.rst
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
 
-- 
2.39.2

