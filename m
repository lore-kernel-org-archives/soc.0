Return-Path: <SRS0=5jFp=JJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE5DC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 13:49:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376E36109F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Apr 2021 13:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376E36109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kE+LW1srJszJ1lSip5vrLf/0RQEQmGgTCjC0dcrdmL8=; b=QSKHC9wvUGkv4xGj6zd57e1YvG
	diEvO3Pi+H1CzUxTIMT+nPIVrSMzV4hlL9ZFnkmhnoqLuLzsdwD4T+q7dbKjif2rt9tOAQV0fIf71
	QLpBFmG5Mx2iQp778bZvibnSbzMcoL3WH+qlqZTgPwMo2rmVXy3pRNsCyy08oDS63mDpEtSt/ytla
	i1OiMRke6lBAK1bPaaP9QNScjmhVduDg23euehSi2j54VXNNego6cIglorsRtwAMiVl6/RUAu/BwB
	sKM0pRpxL0CzS0OV+vNZCc/irX+4W7+1UUsWlhWqjAsQSYgK+p5AYGbhrOI1KkltuPAGCEoNu8Kve
	k+958wKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVwuK-006syz-Sn; Mon, 12 Apr 2021 13:47:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwuI-006syp-EV
 for linux-arm-kernel@desiato.infradead.org; Mon, 12 Apr 2021 13:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0HhOgkxi6adNvPMTz1qTbyoEcmMMeYlubTaxaYt4Nn4=; b=IiHj7SG4DWx3I5tMlSyOHEP80J
 I5eAJLFjQnSAfv4LFpxSWgPE2hLBY4DtvE2DENKdjNJ6Reuuc0/EiJXBmnYii0VE9sa97k0F5sJ8w
 4E20LrL7bOewtX9esjR0zUKcPzA8ZOROwn6q9Gt6dUJIrrRskoJ4Udrm5iTF/97MoviIP+QtlVMpe
 fB2vi0UGgVg8r+6ijuRUIOCLtmXW2WgPKDl2beSZAZxsCzBciQp3ITuG+vqSQzaCls/1LorPSRJj4
 TwlEo6IHPg3h0ql3sXa8ayWEbaHsp0C2oVd9gbWGtIGhULxmj+4Q4eBjz8ooqFJ2cidIzxKnyHyQq
 HENbWfyQ==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwuF-006HI4-6S
 for linux-arm-kernel@lists.infradead.org; Mon, 12 Apr 2021 13:47:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id f17so14425117lfu.7
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HhOgkxi6adNvPMTz1qTbyoEcmMMeYlubTaxaYt4Nn4=;
 b=raMszZJ8T7hmemwqKuhKAF6ZtVOm6r/BoUcHXk31NqmCjMhNwGksjJWkRUJXmwFDXZ
 X24ZHF8Db6QzZ3RNRFsdMobECXS1pIKolOjH28ObDpkAQ+tYSP/asLGMzZr2mlRYPjzF
 T3OwW8T9YAEdE1qQi8M+IzSUyFG5pw8+1ANIizo+yIBrWBkEU+Lm0U8Em4fTHuTSXK60
 Ewc2Q+9/mcMSmJB9HGJiiTwNkNyH45K6JjJzDXgiNevF0wEF4sBQXzzAu6Ejeg0i4pv0
 Zi6R/sFzUsdo7Dx8q8m7ScYG+nTnOMTrGc6hA9yjkmJkN3v2ty72Ufq4TZ1ZIVFOE8Tz
 b3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HhOgkxi6adNvPMTz1qTbyoEcmMMeYlubTaxaYt4Nn4=;
 b=M+4DV/JcB5wpyX+vtuDxu4i0bhMQUxX2oaqXstjG5HesDtNpn1KTo7+ExJHEmvQzRJ
 7xnUAafzuCNp0q2XRRBw9Jl6CRMeIuXvBeZEv0x3KToy2UcsEWCD9ke2MhmcWEiubLzh
 NPiVD/LOlMDUsRV6UYqZMlLoH2nooahBx2uEAe0rvEyH171hTpL+kPPT21t8LLrTI9iX
 O6t4KCm4hMz9TmxHEPEhwIEyNeSnY69BVvYxCeIgDYHC1O7o0Jcdnj01gEmXcFqtxQ7O
 lFchUXjXIr7Z+3ioycfRfL/0YS76KA9Tt6NTKTu2iR6qA4hq8p8j6VcelWKtcV2QWYe3
 hkWg==
X-Gm-Message-State: AOAM530lWI//20n31cH2/RjFmfs6My6bQBMbRP5DkFNmXZdoY7cm4b98
 lm0AuwaYoDs3DfojWvY2KGwaoQ==
X-Google-Smtp-Source: ABdhPJzWZRbQIk98M35U0N56Q8aGHZD2Y9tXG3Xz6Rb7MUonQ+rnEETPgNjyFI0Ps1ERMwFq9jbb2w==
X-Received: by 2002:a19:c509:: with SMTP id w9mr4985351lfe.484.1618235229003; 
 Mon, 12 Apr 2021 06:47:09 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id f20sm2433719lfk.207.2021.04.12.06.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:47:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: defconfig: gemini: Update defconfig
Date: Mon, 12 Apr 2021 15:47:00 +0200
Message-ID: <20210412134700.1977619-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_064711_655092_18754AB2 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210412134700.Po_Eb4vy-lTfVEL2_F8gqb0SHCGAFuapAUvNEjPHshE@z>

Update the Gemini defconfig: some moved options, added som
WLAN drivers existing on the supported platforms and enabled
the drivetemp sensor which is used on the NAS devices.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: apply this wherever defconfigs go.
---
 arch/arm/configs/gemini_defconfig | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index d2d5f1cf815f..4d5409689e68 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -16,6 +16,7 @@ CONFIG_CMDLINE="console=ttyS0,115200n8"
 CONFIG_KEXEC=y
 CONFIG_PM=y
 CONFIG_PARTITION_ADVANCED=y
+CONFIG_IOSCHED_BFQ=y
 CONFIG_BINFMT_MISC=y
 CONFIG_CMA=y
 CONFIG_NET=y
@@ -51,9 +52,27 @@ CONFIG_NETDEVICES=y
 CONFIG_TUN=y
 CONFIG_NET_DSA_REALTEK_SMI=y
 CONFIG_GEMINI_ETHERNET=y
+CONFIG_MARVELL_PHY=y
 CONFIG_MDIO_BITBANG=y
 CONFIG_MDIO_GPIO=y
-CONFIG_MARVELL_PHY=y
+# CONFIG_USB_NET_DRIVERS is not set
+# CONFIG_WLAN_VENDOR_ADMTEK is not set
+# CONFIG_WLAN_VENDOR_ATH is not set
+# CONFIG_WLAN_VENDOR_ATMEL is not set
+# CONFIG_WLAN_VENDOR_BROADCOM is not set
+# CONFIG_WLAN_VENDOR_CISCO is not set
+# CONFIG_WLAN_VENDOR_INTEL is not set
+# CONFIG_WLAN_VENDOR_INTERSIL is not set
+# CONFIG_WLAN_VENDOR_MARVELL is not set
+# CONFIG_WLAN_VENDOR_MEDIATEK is not set
+CONFIG_RT2X00=y
+CONFIG_RT61PCI=y
+CONFIG_RT2800PCI=y
+# CONFIG_WLAN_VENDOR_REALTEK is not set
+# CONFIG_WLAN_VENDOR_RSI is not set
+# CONFIG_WLAN_VENDOR_ST is not set
+# CONFIG_WLAN_VENDOR_TI is not set
+# CONFIG_WLAN_VENDOR_ZYDAS is not set
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 # CONFIG_INPUT_MOUSE is not set
@@ -67,6 +86,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
+CONFIG_SENSORS_DRIVETEMP=y
 CONFIG_SENSORS_GPIO_FAN=y
 CONFIG_SENSORS_LM75=y
 CONFIG_THERMAL=y
@@ -98,5 +118,4 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_ROMFS_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_FS=y
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
