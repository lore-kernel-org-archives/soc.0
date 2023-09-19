Return-Path: <SRS0=YgfF=FD=gmail.com=twoerner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A440CD5BAD
	for <soc@archiver.kernel.org>; Tue, 19 Sep 2023 12:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6162CC433C8; Tue, 19 Sep 2023 12:51:19 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AAC4C433C9
	for <soc@kernel.org>; Tue, 19 Sep 2023 12:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AAC4C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76ef6d98d7eso343556785a.0
        for <soc@kernel.org>; Tue, 19 Sep 2023 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695127877; x=1695732677; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUSFGHFYd5WcIYIhM1XDG+I8py/W3+tKiKFLrkCLv8U=;
        b=MaXA5BbOMOv/N7HXuAIgvR0YLqqkky1m6EbF7nZiskSkPg7fW8gASoNe0HY7W4WBTh
         1UM9VMAGsoSAokB0tN9FseZ5ax0citFLGqsmop5+p6rhANs6QFAW7I6tf5puWSA1B4FD
         2zzhg471gxHZ+MlR7+33GFz/hcVgEADZB8Ni3giYXq7Z+CFow1EeeSx6J+wI6M+4q9uh
         QlGacV7JkAq6LFV+78KUd/305PZOc6al3cSrrygj4rIKqGSGgl+8gfIjcIFSMWpUezbw
         O/sOyhMvGKllsM8qjKIIzPgDj5NsMXyubyGzVGtW6Ln1x2z937/ytkF/nMO6vt2fAROs
         N8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127877; x=1695732677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUSFGHFYd5WcIYIhM1XDG+I8py/W3+tKiKFLrkCLv8U=;
        b=eI1b0T5G0v5TOBwj9Kk769ViKqjtK14e5U9eBcA+pDJtxZL6UcM/v03W/VIevHofN8
         Su4SZ9oK1hsX5iw3jkVqko4uDK9QF+F9/g2NsznIt0Is/e/b+Wc+77ArTIvsM5hxHMCO
         Av1eow4s4axsXyKAg7Ckj74hadEdphIJdreM0kB++mF8XvF4gcKA4F28sOYhG9eU9kPe
         UyCyh4VlX+BQYlIvZOwh0x4coZ9cKFQhrmyir7k3YE3566O7KRTSuLnCuazouin+7GYV
         gUYngCIhqhiCUffuKKMnrM9sf3lhqB19ElopEK0vcepMpHtMAs4qzYcMEu30gZ4Z0Q3F
         w8JQ==
X-Gm-Message-State: AOJu0YzXdb4tvOcw84duMlP/B9LVE00LISDf3cQ7/EL7AhfDjDeK0hUw
	ZBrI+gO1grB5FMT4G1b7oos=
X-Google-Smtp-Source: AGHT+IGDc+JnxgDWxiIhBYGrddjqysKVcRLkpOZcaIESpnxdkgGjemG9SnH5wVjMz8KjrhwM7ESjzQ==
X-Received: by 2002:a05:620a:4544:b0:768:1db5:d9d1 with SMTP id u4-20020a05620a454400b007681db5d9d1mr12315999qkp.5.1695127877328;
        Tue, 19 Sep 2023 05:51:17 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id y7-20020a37e307000000b007676f3859fasm3936508qki.30.2023.09.19.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:51:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v4 1/1] ARM: defconfig: cleanup orphaned CONFIGs
Date: Tue, 19 Sep 2023 08:51:11 -0400
Message-ID: <20230919125112.15515-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230919125112.15515-1-twoerner@gmail.com>
References: <20230919125112.15515-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop CONFIG_NF_LOG_NETDEV as it was removed in commit 1510618e45cb
("netfilter: nf_log_netdev: merge with nf_log_syslog").

Drop CONFIG_NFT_COUNTER as it was removed in commit 023223dfbfb3
("netfilter: nf_tables: make counter support built-in").

Drop CONFIG_NF_FLOW_TABLE_IPV6 and CONFIG_NF_FLOW_TABLE_IPV4 as they were
removed in commit c42ba4290b21 ("netfilter: flowtable: remove ipv4/ipv6
modules").

Drop CONFIG_NF_LOG_BRIDGE as it was removed in commit 77ccee96a674
("netfilter: nf_log_bridge: merge with nf_log_syslog").

Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining arm defconfigs as it
was removed in commit 9db5d918e2c0 ("netfilter: ip_tables: remove clusterip
target").

Drop CONFIG_USB_MUSB_AM35X as it was removed in commit 57f8e00d8a82 ("usb:
musb: Drop old unused am35x glue layer").

Drop CONFIG_NFT_OBJREF as it was removed in commit d037abc2414b
("netfilter: nft_objref: make it builtin").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/arm/configs/keystone_defconfig  | 1 -
 arch/arm/configs/multi_v7_defconfig  | 1 -
 arch/arm/configs/omap2plus_defconfig | 8 --------
 3 files changed, 10 deletions(-)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index d95686d19401..59c4835ffc97 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -98,7 +98,6 @@ CONFIG_IP_NF_MATCH_TTL=y
 CONFIG_IP_NF_FILTER=y
 CONFIG_IP_NF_TARGET_REJECT=y
 CONFIG_IP_NF_MANGLE=y
-CONFIG_IP_NF_TARGET_CLUSTERIP=y
 CONFIG_IP_NF_TARGET_ECN=y
 CONFIG_IP_NF_TARGET_TTL=y
 CONFIG_IP_NF_RAW=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 23fc49f23d25..9d280a6d9bfe 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -857,7 +857,6 @@ CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
 CONFIG_USB_MUSB_TUSB6010=m
 CONFIG_USB_MUSB_OMAP2PLUS=m
-CONFIG_USB_MUSB_AM35X=m
 CONFIG_USB_MUSB_DSPS=m
 CONFIG_USB_MUSB_UX500=m
 CONFIG_USB_UX500_DMA=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index b685018dcf54..b2f0862f4bd9 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -78,7 +78,6 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_NETFILTER=y
 CONFIG_NF_CONNTRACK=m
-CONFIG_NF_LOG_NETDEV=m
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_EVENTS=y
 CONFIG_NF_CONNTRACK_TIMEOUT=y
@@ -92,7 +91,6 @@ CONFIG_NF_TABLES_INET=y
 CONFIG_NF_TABLES_NETDEV=y
 CONFIG_NFT_NUMGEN=m
 CONFIG_NFT_CT=m
-CONFIG_NFT_COUNTER=m
 CONFIG_NFT_CONNLIMIT=m
 CONFIG_NFT_LOG=m
 CONFIG_NFT_LIMIT=m
@@ -100,7 +98,6 @@ CONFIG_NFT_MASQ=m
 CONFIG_NFT_REDIR=m
 CONFIG_NFT_NAT=m
 CONFIG_NFT_TUNNEL=m
-CONFIG_NFT_OBJREF=m
 CONFIG_NFT_QUEUE=m
 CONFIG_NFT_QUOTA=m
 CONFIG_NFT_REJECT=m
@@ -179,7 +176,6 @@ CONFIG_NETFILTER_XT_MATCH_TIME=m
 CONFIG_NETFILTER_XT_MATCH_U32=m
 CONFIG_NFT_DUP_IPV4=m
 CONFIG_NFT_FIB_IPV4=m
-CONFIG_NF_FLOW_TABLE_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
@@ -193,14 +189,12 @@ CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_NETMAP=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_SECURITY=m
 CONFIG_NFT_DUP_IPV6=m
 CONFIG_NFT_FIB_IPV6=m
-CONFIG_NF_FLOW_TABLE_IPV6=m
 CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_MATCH_AH=m
 CONFIG_IP6_NF_MATCH_EUI64=m
@@ -225,7 +219,6 @@ CONFIG_IP6_NF_TARGET_NPT=m
 CONFIG_NF_TABLES_BRIDGE=m
 CONFIG_NFT_BRIDGE_META=m
 CONFIG_NFT_BRIDGE_REJECT=m
-CONFIG_NF_LOG_BRIDGE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_VLAN_8021Q=m
@@ -560,7 +553,6 @@ CONFIG_USB_STORAGE=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_TUSB6010=m
 CONFIG_USB_MUSB_OMAP2PLUS=m
-CONFIG_USB_MUSB_AM35X=m
 CONFIG_USB_MUSB_DSPS=m
 CONFIG_USB_INVENTRA_DMA=y
 CONFIG_USB_TI_CPPI41_DMA=y
-- 
2.41.0.327.gaa9166bcc0ba

