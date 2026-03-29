Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211685C4A
	for <soc@lists.linux.dev>; Sun, 29 Mar 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774764957; cv=none; b=iXlMD6GNndSaVl9g/nMcUIUV/fD9vtZ9TDBGnx/sZCNoyUbA7FjVUk4DjSzI8uyWzjVcRit1qFO8hljhj8ttJaiVSoNCPd7w64KTu9bjcjYnwRJt7RA5kUi242sZ4eKUv4I1FU4/5PbeMCbFJPgTHYOklm7ta8J062w+RTcM7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774764957; c=relaxed/simple;
	bh=iL31+SMrBzKCE3ncPrH6N3IXt0HrvrV+OHrHkY3ZenQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKQd3kLEsrPb+W2iHBWw1eG5+nS0doNNlSKrlK9Bsn5XB6rbuOGQInjdVMsvLtcggwH74eJOibDAzzgETganltDWNih2h3KMMD5PHEMKJb2eyHNkRVcFo1GtmhmU6n9QfmY09Tpcny81/GvMRt1FZiSh650K/GAn/106UVzB8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBvC3CN7; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBvC3CN7"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82a07738118so1957199b3a.0
        for <soc@lists.linux.dev>; Sat, 28 Mar 2026 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774764956; x=1775369756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzSVIyxJVE3INc2YlO2V/JlUMWvH8XiTteapFFYHtbU=;
        b=eBvC3CN7q9RM7NOhdy0Pau4XJKwpdogRAhJ4qJzUbOp6tznuuU4PJYecemMAr9VUy9
         shXhxhhM0hhgb9XlxZNAMBU164ePs7rbHNGXgeN6z9JW38y3FXUVUeXqkWch3JDfJdxF
         fe59nU8iMUqVmu4HedC3+eZ8qOE4/6/5z3WTR7lGSgf+DRj4XgJoCIs9cg2qADwS9Hvk
         txPTU6pwc9NHP9ayaaN9nTU1hUQ0os9lwi8TV1F4uNtVKJWg+7arsZTrR7xFinD33yun
         5g/Kv2VhXkHgivhDYimRs/7gnInbMRjYzCwWfTN9QCH9a2Gu2kfAwaqb/J0/o0cXm31x
         WuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774764956; x=1775369756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzSVIyxJVE3INc2YlO2V/JlUMWvH8XiTteapFFYHtbU=;
        b=sD5bVD6AJdLOmHuQ9jr5bK7+lV9BLjD91NKBL1t0qMPUoWEL7t7ojHwKOSWTin/cC/
         SXD0oRrZ+7tnNFBA9LGSltnuLDsUkN6l9mSkiQBfs6sj/DZHzMz4ERkQ8/RHCvxDNz+B
         Y2ywsnMPKHH0rVHFLQEFFb6nwHR59KhzZieIFIMF7ai3P0LgOnb+Rw8BUQQj7MYloUWI
         aEPGd/uP5syIXyo3M8kpz4aCVnkZPvnjCdNdcfTXwkUjPoRxDCeUGm00EBdajulBjg6A
         QIHekTdQ420sOfhPBjdditN9oxmyW7JmypJqeYFIxW1Z2fkPtbXlmJm5bkj5uLyPCmlQ
         Zhcw==
X-Forwarded-Encrypted: i=1; AJvYcCV8aBGKlZuIno2hDiRddbCJJ6n42/0oYpzX0nJeYL5qrIG/XKc4AZUgpoHeMqedE3b+ZmA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4XxXycBgkbL1e5y7iZXencbn8mvMAnp/cpjsDOe3swnosBceb
	De/J/BpXrapHbjpb6rzFgYJPnvvcuyNh78LXf64VRA+ouvUzmPqluS/Q
X-Gm-Gg: ATEYQzwK/MitAnv3xIaJhcVKV3f5XjIwviz1WeyLUDRSSDyejDp44DaL4ygy0X+Yfja
	oZhmOqCPRMihg0TlbQn6y0BOS58UEyjt7Ppzl2+qwZ9tJm9XN9eV7F0JuRxIq6tViFprSpLx2+r
	HgXF097nDtejlT94EDJPisGHwrMAkLp955fMCBUECn7aJUzQpf5dEJjg0OZFZNDtwmeNpSwiOB9
	I9IuJnsO+ZR5qQbTKcfNKQdu8Ic8iIw+XukyzLrFn9b74eNagHxD4KRNlfYENenOlHXOg2m06PJ
	8jkVGYDVZdQaF6Jg29uZq0rvT0Dw0D1ALzSt/pvEyyeYHL1iwMDnOxRxTkUEnw539KhLtxvHfGi
	bDcc5PBBvtbKtdMZVkG0zx31w6p9+yY08o9zQBp0w7SmqLnVSMniOr92pV3VlGaDHrmU2TroqsS
	fHk86wheaqmLDpt7QjnLzuNrLSsvfkzkhSxoWzjOBfDeqfk3E+N8CeTEn4n6fou1GX6lUA5sFBq
	9E=
X-Received: by 2002:a05:6a20:7485:b0:398:9466:2eda with SMTP id adf61e73a8af0-39c878c4986mr8419647637.19.1774764956074;
        Sat, 28 Mar 2026 23:15:56 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm3709731b3a.9.2026.03.28.23.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:15:55 -0700 (PDT)
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
Subject: [PATCH v2 2/2] ARM: dts: st: spear: rename thermal_flags to st,thermal-flags
Date: Sun, 29 Mar 2026 11:45:20 +0530
Message-ID: <20260329061523.98346-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329061523.98346-1-krishnagopi487@gmail.com>
References: <20260329061523.98346-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

st,thermal-flags is a required property in SPEAr Thermal Sensor node,
which is incorrectly written as thermal_flags in spear13xx.dtsi.

Rename thermal_flags to st,thermal-flags to fix the property name

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v1:
- Reword the commit message and subject

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/st/spear13xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 159e941708ca..97357680dd51 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -332,7 +332,7 @@ wdt@ec800620 {
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
-				thermal_flags = <0x7000>;
+				st,thermal-flags = <0x7000>;
 			};
 		};
 	};
-- 
2.52.0

