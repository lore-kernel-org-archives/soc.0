Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9790C636D4
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 16:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B10CEC433D2; Mon,  6 Feb 2023 16:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A042C433A0;
	Mon,  6 Feb 2023 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675700813;
	bh=UiX8dWmcNYgC2BRpZ7bUsXEbentZ5qgfL/6iuaNyd+Y=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=lcYbIMGXraxHnOErJlP2lfpVb7FwkWnWSnq8bwyMyCX4bIsKTJNVgEGuvSgp0FagQ
	 ehT6vPrdTZvcRLYWPzWfou4oQS6yIYLwUFNxLCHCSHl83wVjlJ9kke0/x4HZt/i3yj
	 owLbp3X/42NKwRd1OculK0Ceeg4r00XqZnp6oca+CyPW0sfctbcxKImjWcGbx1g1IG
	 oJqHDbVUQUDSG1/EnY3MGL49yprvfjnV4nbnPSP8K+H1l41eZgwrewcSJsoxD8Hia4
	 EkqqXRpUEOzqmgdLb3ut3iaAZlOBEKxUfuAOi+LnHOvZee5u39mVLVhJkEm3lCbxil
	 otwUO/QJGNcKg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 06 Feb 2023 16:26:34 +0000
Subject: [PATCH 2/2] arm64: configs: Add virtconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-arm64-defconfigs-v1-2-6d0d03a6dbd2@kernel.org>
References: <20230203-arm64-defconfigs-v1-0-6d0d03a6dbd2@kernel.org>
In-Reply-To: <20230203-arm64-defconfigs-v1-0-6d0d03a6dbd2@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, soc@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UiX8dWmcNYgC2BRpZ7bUsXEbentZ5qgfL/6iuaNyd+Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj4SpHRJl/cvrooHgr5RqR7rK1OBGVs4zN7uGtJQpG
 lCyAOZ+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY+EqRwAKCRAk1otyXVSH0GZXB/
 0akNzGxa4RphYz9NtYAAP72aPgS/MYdemQDbw+oJ/XWvcsRaUPVEYmZHDPGU2DjzCDIkqBS2PoBgvq
 HoSx4p+IoJnFHAALfYst90d4UkiaeubzYgUpTiaUrhnIecZyLFgE+Q5vfsOuMqJWpqOZzr60Hk4ZYR
 XuIuuFBii4pSpou1BSdvAM0j56kTFQ+P4AbmtnFIgsWtAlyDm0JmJ6xcHpfIY+6x1mVVAjvUgBaJrQ
 ENPcgrWIlcIUC5hCuln+YHuB3o38qIGWOOr54GWp+vI0+bk4tUtSxKNAYKne8aiU7887SSJbJxCTor
 zZFisRhhuQTpetfCIXIEdEirtJTzJ/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Provide a slimline configuration intended to be booted on virtual
machines, providing a light configuration which will boot and
enable features available in mach-virt.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Makefile            |  4 ++++
 arch/arm64/configs/virt.config | 43 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 491ec81ae0b6..e86bf0ff5327 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -211,6 +211,10 @@ PHONY += defconfig
 defconfig:
 	$(call merge_into_defconfig,base.config,platforms)
 
+PHONY += virtconfig
+virtconfig:
+	$(call merge_into_defconfig,base.config,virt)
+
 define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
diff --git a/arch/arm64/configs/virt.config b/arch/arm64/configs/virt.config
new file mode 100644
index 000000000000..a67903e15196
--- /dev/null
+++ b/arch/arm64/configs/virt.config
@@ -0,0 +1,43 @@
+CONFIG_ACPI=y
+CONFIG_ACPI_HOTPLUG_MEMORY=y
+CONFIG_ACPI_HMAT=y
+CONFIG_ACPI_APEI=y
+CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_PCIEAER=y
+CONFIG_ACPI_APEI_MEMORY_FAILURE=y
+CONFIG_ACPI_APEI_EINJ=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEAER=y
+CONFIG_PCI_IOV=y
+CONFIG_PCI_PASID=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_ACPI=y
+CONFIG_MHI_BUS_PCI_GENERIC=m
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=m
+CONFIG_DRM_VIRTIO_GPU=m
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=m
+CONFIG_VIRTIO_BLK=y
+CONFIG_MACVLAN=m
+CONFIG_MACVTAP=m
+CONFIG_TUN=y
+CONFIG_VETH=m
+CONFIG_VIRTIO_NET=m
+CONFIG_SOUND=m
+CONFIG_SND_VIRTIO=m
+CONFIG_VFIO=y
+CONFIG_VFIO_PCI=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_MEM=m
+CONFIG_VIRTIO_INPUT=m
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_IOMMU=y
+CONFIG_XEN_GNTDEV=y
+CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_EFIVAR_FS=y

-- 
2.30.2

