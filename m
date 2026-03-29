Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B136C0B1
	for <soc@lists.linux.dev>; Sun, 29 Mar 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774787722; cv=none; b=SqmJXjBw72OPUF08iNK9hNl2brcDNE1XK20XeFluVUp8u2At99YtoQ/DY461tjwApA8oJQ4jFEMTGqz7pCJXCdOMagMl/34kJ3+qy/UuCF6pvFSK2ZgidbIsegFM2sJSKgyPgJMDjEIAfuiKThab7S4InDtVxhiiQL4QMojbD3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774787722; c=relaxed/simple;
	bh=hb3b5Xn6nqgDmPUXGa8SEWTqyas5qT4V0APOofxhyPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miWVncdsu0jghU8AdejfAMaxtuLBYtC1TKRqQzDms3RrVhMJe9i1Lr67ADWLifTQd1zPpIXzmNFHwLNDJz4K874T7NERytd/cuNd8JNOGSIZZcv2MkXHP+smNr9vt45839ltSHj7PZ5bqHAhelqFIVfp0X8KAE94BuDn9kazfzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct/+fYe+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct/+fYe+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b23fcf90b2so15317355ad.3
        for <soc@lists.linux.dev>; Sun, 29 Mar 2026 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787720; x=1775392520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wKSxAHN0Stzff0w5tTcgOX+ksB7Z1iTuqZjXxjUVhY=;
        b=ct/+fYe+jCqEfTHQZpi+PFZv6zv88RMQ0sh1p+7/LsGD9eU9+Pc/F9+UD4RnG5nV92
         YRfrj1n++Ozj975xp4knm2dqP57sc2nITAxm/vkEObYhqZ6Mj8/NNetix+WiTnXZ5Qtq
         d/15gWPgrbhlcf3Nxl9iQcCejNF7C/2dSjz7r+SwEsDfK9qNlxkk0VK9Vu+YqBi/puFU
         BUmZRG0G6/BjZm9q0SdW2mMKVzVujUT23iNZ0HoZjJAMEy7xDeazQFrv8WLNJk7kByq1
         WP5f+3+leJktNKcAgHUDjUjBHRt+pG8LBfc1jLXzKtIoOHaquP4DI3BsWxq4pyHhhG6E
         mohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787720; x=1775392520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wKSxAHN0Stzff0w5tTcgOX+ksB7Z1iTuqZjXxjUVhY=;
        b=HCdgkxDCuRBXE5vl63ueovpqhVD3PtXJqC8wSfYqJ3fqcJ8on23atepEVPerlGa8V/
         UUyN46W0whfCeTv0KpD5hk6D0ita59gtZAa7X8/l/OfLSyYSwfRpmLoqZE9t7K4jbQCu
         Awn09BZ6itUNLkaxLrESl68qIjYKWqunzEs13hL5iUndWuQnPYxuVnf7dD2QwOjpx84N
         671winnnVaP4vQgZpSzFBOv1FozMD5dF1ewMEqiTM4lqppGg6TeegDbYnNU/5Mmg7zXu
         JJGs/q24RL/5L8VOLN32OF/gGKPRpQJj5iliLY58FFVQqFt4YDn6VZHKCZYeIfcMjnZM
         F6Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVZZDHqR8kvCTOeFw3shWnXnG3SJ6IQg3WYqCRTyTtN2FVTlEPyJFoL+gYtM8yMB5wfxUM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEs42KAUZe39kxi8zJjz2s3/wMl5Y/eBDG48IRExNAxiY2gZwE
	j5brgmdDbg69t4/s1kYt7Xh9d/Ew4BP2+EeAbVQJZ+YxzAo6sPVvVvfm
X-Gm-Gg: ATEYQzxMKimMyXSmN+rsY3RWmwswb08m6tsxGOpu61t7FMusTmWZ7g5eSIPSzE9S0GU
	XC1XgjMBpvWahme+sIHRmY+EkaMTDdHJpwseY6fKYoPoGkg8P3k89+La/uSfu9OUG3wt+2Qbvdf
	sB57s3nGjnomQX3f2XExWrMaWTfxv1HpRQ6mbDr0KDpRS7s0W2g/SQFOR/rXrBoh3IFLzFtFQZ9
	ylFMKCCTezsKeZ3tSyLAgEvQEh9ApAfU6DaY+LAj0lAPwYlYT3S3tuRDhx/2FbMCg5d65tayLtk
	mGWnHvcDp+Tw12bVnnCKjoAXHGtciqfKupLBYthFxZpB0m/LOvHVM7MujJf71zXKBJd37u1GurE
	oG05PClP4PdrX6LK0sPEJ8Tj1isjo7Ntn8VoPH6NKrrOj47uwP5ubifvOsK1st3SQMsjbD30vcV
	QQNnOYBJP4VxNr9PNfwHgfRnhKAzatEuoJSHjiCd5BI1YZTV15QvgKzAUEL9/A1oib1xcOW6m8h
	VQ=
X-Received: by 2002:a17:903:1a67:b0:2b2:51e8:2c20 with SMTP id d9443c01a7336-2b251e831bemr6342265ad.21.1774787719650;
        Sun, 29 Mar 2026 05:35:19 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:19 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v3 2/2] ARM: dts: st: spear: remove undocumented thermal_flags property
Date: Sun, 29 Mar 2026 18:04:44 +0530
Message-ID: <20260329123449.309814-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spear13xx.dtsi defines a thermal_flags property in spear thermal sensor
node which is both unused in kernel and undocumented in spear thermal
sensor's binding.

There were no dtbs_check warnings associated with this property as the
underlying spear thermal binding was not converted to DTSchema.

Most likely st,thermal-flags is a misspelling of thermal_flags in
spear13xx.dtsi. Since both st/spear1310.dtsi and st/spear1340.dtsi
define st,thermal-flags property in spear thermal sensor node, we can
safely remove this property from spear13xx.dtsi.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v2:
- Reword the commit message and subject to correct explanation in patch 2
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/st/spear13xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 159e941708ca..0bb88f2d4ef5 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -332,7 +332,6 @@ wdt@ec800620 {
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
-				thermal_flags = <0x7000>;
 			};
 		};
 	};
-- 
2.52.0

