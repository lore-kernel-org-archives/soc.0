Return-Path: <SRS0=nqVE=RH=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249ACC433EF
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 00:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9D9EC36AEA; Wed, 22 Dec 2021 00:41:34 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCC40C36AE8
	for <soc@kernel.org>; Wed, 22 Dec 2021 00:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCC40C36AE8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id z3so552012plg.8
        for <soc@kernel.org>; Tue, 21 Dec 2021 16:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xSiLCRfyYn9JlF/9t78eQuwkxdgaMPJvTaQ0fCfgGg8=;
        b=NrBXSGCtg0njWjIEvfNL3LxU8yxaM7HX2AWVeya/8nnf0H5T11XuWgYE/YiaQ6DSJe
         pWgXDZ4f9hNsk2J3ohIYBvnMyxyc2Lr9ryT8FOgkP9doq00KK6w1OdTveMggtJSRRyBK
         +1qFSLQkOVGiMmpnwGeLciOozIroWn03b3jp6QU3oiRYBPlYfxrOo61djWWnObzCzHd0
         sGb2A5N9PT5eWTGh20woYTJSR6zyiNcFbdVe4nevWPTB0q2TADO/XaGhii8P6jbAZI5v
         BKxfv6iAnYSDblCB0FF8dxK1SuRN9JTygoJDGivrsGnpxdH2tb8nPGX1gmmo+v2rJnuz
         wN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=xSiLCRfyYn9JlF/9t78eQuwkxdgaMPJvTaQ0fCfgGg8=;
        b=RSs1GbqKpavfV+hwdvbyytS3KACupilk9raPhajXsA5tn+oP55yGI0mOg7qr2ZmIHG
         LLlyiKvnH1QkbOb7zL631QQx3D1tdAUjCIxjUhvjFwIlPNrLFZO7/aUnJxJtiab9s0TM
         9PdBF9NHvJsiWgoFyLy3aTA1nLawaXlb3sVDAMI0zD0iz4dtSk/J8/C814QB7sU1daro
         /SFqUhbS6RX2gX+KaA0/bNSkZPyfkENGkKk0TGTqHlgFopwRRN36iXwpuEXKs6aA67YD
         Dpt6NKu/VoHEKNNUx3HmrPjB17hV34ythX9wHQlMmexqcUnHEDaGGWdbDgteaJ+SFXiw
         rDhw==
X-Gm-Message-State: AOAM530aSs2LnnYY1jeNeigVPtYB1WjUBei6acD3KnIlTiHFsjIMpmy6
	RKz0LPm9htRaTW3SdHWNai+u56h7fHg=
X-Google-Smtp-Source: ABdhPJzUVmF/tXMhjp1moSnNK9YghU3usdelvQvzZamCO3WNVmc0Z8OrVmBPJpncJPPDqO7Is1JQgg==
X-Received: by 2002:a17:90a:6045:: with SMTP id h5mr1019705pjm.147.1640133692551;
        Tue, 21 Dec 2021 16:41:32 -0800 (PST)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id ls7sm182261pjb.11.2021.12.21.16.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:41:31 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH v2] ARM: configs: aspeed: Add support for USB flash drives
Date: Wed, 22 Dec 2021 11:11:23 +1030
Message-Id: <20211222004123.128157-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adriana Kobylak <anoo@us.ibm.com>

Add support to detect USB flash drives and create the /dev/sd* devices.
Also add support for vfat to support USB drives formatted as FAT32.
This support will be used to enable firmware updates via USB flash
drives where the firmware image is stored in the USB drive and it's
plugged into the BMC USB port.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
Tested-by: Adriana Kobylak <anoo@us.ibm.com>
Link: https://lore.kernel.org/r/20211112202931.2379145-1-anoo@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Remove stray (and duplicate) FIRMWARE_MEMMAP=y to avoid warning:

 arch/arm/configs/aspeed_g5_defconfig:101:warning: override: reassigning to symbol FIRMWARE_MEMMAP

Please apply this one for v5.17

 arch/arm/configs/aspeed_g5_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index ae4f3c56ae6b..591b65695725 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -83,6 +83,8 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=y
 CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
 CONFIG_NETCONSOLE=y
 # CONFIG_NET_VENDOR_ALACRITECH is not set
@@ -200,6 +202,7 @@ CONFIG_USB_DYNAMIC_MINORS=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_ASPEED_VHUB=y
 CONFIG_USB_CONFIGFS=y
@@ -246,6 +249,7 @@ CONFIG_FSI_OCC=y
 CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
+CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 # CONFIG_JFFS2_FS_WRITEBUFFER is not set
@@ -261,6 +265,8 @@ CONFIG_PSTORE_PMSG=y
 CONFIG_PSTORE_FTRACE=y
 CONFIG_PSTORE_RAM=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
 CONFIG_HARDENED_USERCOPY=y
 CONFIG_FORTIFY_SOURCE=y
 CONFIG_CRYPTO_HMAC=y
-- 
2.34.1

