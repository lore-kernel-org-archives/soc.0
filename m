Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678A23372D
	for <soc@lists.linux.dev>; Mon,  7 Apr 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026084; cv=none; b=PTk9+9txcXaVoZ2QL1V3WwJEiZ845X20iH+R0RyD7wlf0xBnWQMWsoqhhabVMhiv5Hb7+dyWFUYSJ1GgKG0umlATnzq9mT1EyVl4BPOgnuWX8FV9ZmVl/NqhzbAq/kwij4A5/cZn+pgH+lpZl73TaOTD8UoQ2/iJ7ZaGkkMWx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026084; c=relaxed/simple;
	bh=hZf9aBKMYg9drwsY1ZL3tP8lX7Ry40MXQxQH6VX6yLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZqcM7RRPM4qh3pic7RyBZGWvPC1v9zwfZ7G1aPaBepQ3vBuhRtZSFG8/lGAFnGQ92QSPTD/3UD6tjGb5yeVrKjaKAwe6ZMMflfhcdNNl3hR8zynS8ticBTSVCaXotMF6JTd0FWbxzZVCAnevTHabvG73e6h12pI3no7pvsBIJ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=0TMcQc4K; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="0TMcQc4K"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f7031ea11cso46644187b3.2
        for <soc@lists.linux.dev>; Mon, 07 Apr 2025 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1744026082; x=1744630882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6bubJ2d+BmHRmgs70y+zlLbzWUmkntEheMY266sG6w=;
        b=0TMcQc4Km0o4h3p49zbg7cM2GCNizMwScymoUKZzhfw3Xahj3SmcxRZAzzALRKfhVK
         cR0aa33PLK/C6+jbOywEmBa58K9b5DtcyHLOjloaOij/aI8yiV7cyTgxoOniSCOPBGqs
         aQERn33+o0yHes8brEeHjBQm3YyTEvDNd7iEEXm6vEu4pbrghKlIoYx/2XQY6n1ASzTG
         gFHS4fLBr2iPr186XYOuMFtJwxJGCWitexOcLaS/vSHvYm243X0DzLRyJv6mhHz89mho
         o2kkG04W1vcKe0zquREBWoY+FIXHPLeWy85k0ECE3TblVGVJl6Hbt3zFjvov92LY128Y
         xbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026082; x=1744630882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6bubJ2d+BmHRmgs70y+zlLbzWUmkntEheMY266sG6w=;
        b=oj5LfWVA4mFUbGWxDyLEDgoqiKVPsn3mJ7GN7w1sflYJHWAUs1otuwxXtWEDBnIfE1
         17eMIudW2Ah2sZUcZirTrWS6OeKaNLuEyl47cH3g+R8Un5pH/3fYhsNrjCg4uE1vhZik
         6MxPICi/hW9a6sIV9uSFav8MbaWlVMnWb8j0VuoeGBtXM/ZoefxjRz4rIU+LGBVX539u
         oQyeymJnQ5unUMvpWi/kPZHV5R22Pjtb9yOxPeEiCFaD85wtfxD2DoKpMbvHnu3wEW2i
         sX3M9jq4mHSpiL8SuPcIQR4vZd+Q9E2fO+Lh48UtX3c517y4I1cgKPrCiNUs5DgRlUUb
         uAUA==
X-Forwarded-Encrypted: i=1; AJvYcCX5PHF9uqXrlWhZc0DIHd9UWRV416Q59CWjs/KtCK/EfsujxdLsRTvaT6BFr7bpvp0+R1g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9mrdAQo+3a5UEa0dc6R/fNW4dn1K4H37q4lqIfEOGlabTukAA
	yjQpT1seY1pWsMCsUB0ShXhc3/3S42FoEaF2VESdRDqQDXPcIBLqtnr38u0ljpk=
X-Gm-Gg: ASbGncv/djNDdVgtNXzDo4Md5hXdPh0CISjxg47CJeOc0lFWeSGvHNJomsCakRHHHx1
	WU3U7BLwWa8eFJieTaRrqNZoV3XD3pAmuZBCGErNV1z+4cd0R+RjsgNS/DyivOlGf7X91D76HS9
	o7RPMF1eR1qTBqW0PPfrljmvVcsGRmPutCQgfWyh6ke5fXPLm06jMasnH7CdDSSR8Tzm9umSPbZ
	Gpr5devamsA0O7MAZMwcb4JgK3Sjl77hcxenjDak84EQO89Ij++8OyoBiPll+tEqEleVmoMRYtL
	l8sPLkWdDLnET5F+0nHlr7gEgOSngz6Mqkud6W94y28jd0W4El4hwv6SDvvjzCCJtyoUcL09g1n
	wMQiLcdBi3oAQ636YtA==
X-Google-Smtp-Source: AGHT+IEH2+urCNhcYCnjnsCmCmufxjCnfY74JrlqFCW51UfpadBY73PwrLHZ9pw8pkedOhJGBs1p1w==
X-Received: by 2002:a05:690c:3345:b0:6ff:1fac:c4fc with SMTP id 00721157ae682-703e3358b44mr203631067b3.37.1744026081737;
        Mon, 07 Apr 2025 04:41:21 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-221.zg3.cable.xnet.hr. [109.60.82.221])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-703d1e2fe51sm24841567b3.9.2025.04.07.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:41:21 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	soc@lists.linux.dev
Cc: Robert Marko <robert.marko@sartura.hr>,
	Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH v6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Mon,  7 Apr 2025 13:40:28 +0200
Message-ID: <20250407114116.3211383-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v6:
* Rebase on top of next-20250407

Changes in v5:
* Rebase on top of next-20250131

Changes in v4:
* Rebase on top of next-20250115
* Pickup Acked-by from Daniel

Changes in v3:
* Rebase on top of next-20250107

Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..77f2b481238a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.49.0

