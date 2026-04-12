Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B197308F3E
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013979; cv=none; b=AEVtLaMXCgiGE5PgDUKJ2qYJY8dW2J3A4WecCBpN6VJS8mMC+d8DQQ6V98HffYW29xu8dsYHCZRui4K11FvpbYTTyh2+2JEL2S6OP4uQlVLMEhd1CYDb+RbXZQYKWw4IobRZZ2FG5i6Fv440fDYH4iqqqJLyo6PRwfQaC/e7ZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013979; c=relaxed/simple;
	bh=jjIEBMQ8waMqMWAZa0PumarSPjZYZOqQbKDr0oElp8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9drX8EZXo+PbDUZK3TdQeKpHNS9D4TtHRgx+aqVpzYdA6Dx2jGzG/LYEiQQKZcwNGod2mVE1WnTbmocnc1WmIFlXBWlS8cwdM6ICypLVjmtcRzRH8gRDWPb+sgwpjvY3rjn/t0AtkJTMBdGjwnSbQTPZFNkoc7hmwteQC/mh64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5WGEaYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7J5tlBG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5WGEaYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7J5tlBG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4gM1531170
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3T4p9Po57gL8RRR8ofgCbqP4BdGLIjWvMreG0U33+sc=; b=H5WGEaYlfX6UnXnq
	D9VoEbtRUHEvk+51jV3qYC7Sum8xgffF56MwUNq0J/pbXNfQ/0t5J0eHcqWurUXB
	Q7JwSuWjDFuVJd76+uL6a40cykuLDSdyPXQyoTAoNyLrne4OdnRzjcn9gzRJJNdx
	rPDQBEC/2KyBuda89CUFloqU4f2FUX4C+N0VcsUYvsDesZL1/CrWe57IudQfRw5l
	1ZuDDE5PcmZcvWahvpLvNA1ob+j0DdkeKrbaJ67y1NeRMfItVl/3UzvYV5zgF/Xa
	ZSDXDbZlcym1wEGFfByWlkvyvgtgnayCJaOmzArGvfR8NVIfDS+uIJi+HgB5oaAn
	+pw+dQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2baq8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d6bf346adso71933531cf.1
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013976; x=1776618776; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T4p9Po57gL8RRR8ofgCbqP4BdGLIjWvMreG0U33+sc=;
        b=M7J5tlBG5jeA5IpCXlDiqL5mMbJ0oyTyHX2P/AnvywbKOOtzsB1re3Ian2h4VPEg3A
         KE+nrhYaVbQcIJ8SzzwBKftJOp5hf+yTR53Il9igOb+bl4QTGtxeRlhqL3ty4vOuYCRc
         Cdi1gU8cEF82qQ7/jsiOxGydkN31EIif+mXZPcrx9FHM80MGP6SaZLm2JdQ18rsg22t4
         DlSffuoQR0Vhys+KaxLgR1y6IB+q74Za6YWwLVUNjCJNJlP2HsvdHrNte86A8iFZ3kIy
         HbP4DzqxwZGXx6jrcf98cTG3at+v3URl8/qcEgFyUu90ENLrWrbXYbMaiPeSRYmO4QTW
         YUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013976; x=1776618776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3T4p9Po57gL8RRR8ofgCbqP4BdGLIjWvMreG0U33+sc=;
        b=RBW+65EVy9CM+XAKwJZX3hrg4ikfhExEHG3UJmHlHKxyJ0v4Ff7jUwG4oK+M6HTUiS
         J70SN2rmQwHqPoBaY6VCzlVLm1Mw7EyaPWfLw2fuPHRyVwcinne/nyWpzpl+ebQ2Q98h
         8Bsc9iwO3rNkjqTcP5G7XqkrHrB7w6odHyI1mae3De0UcRoFBiDRJHxOi6THQFp4Cn7+
         QTUzjzNf+C6owXyjFOxyHxisNSBBYkwp48HQWk7fl+VoLbcxM/f1XXNMyzYeXl2VUypv
         0OFBojr7tdRCkTswLIF0qW9cPAVVWm+db0mqzNRaKzA9pVaHuHIHlRRwgqrEHG6uLj50
         6yNg==
X-Forwarded-Encrypted: i=1; AJvYcCWE5dbgbWnClMz4/YkJ6jzDSUqA8L5dA2w5jFvsyxm5vVmUb2vL4t66YpmsIPMMK684jmg=@lists.linux.dev
X-Gm-Message-State: AOJu0YycLUnLSkOC15Aauc8Ph8W6DAaAnDayNBsihd9kRghZ/U4r+cBx
	eu7AzJ8MCRUIiG38wAxNQw3SOPjWeYDp5gutXTaQCWvCX1QfT4dA/CCwS8jNK2K/zwpIK63142E
	Y8T9rJLDZB42oHQqZdlmxm4BkPwaH97DI/qgq1EnCJ12+7fMeUPfBMns=
X-Gm-Gg: AeBDiet+FnoYnNpdZ2FT4Gx5L+IPsAXhwKNmwe6eWTBcrgIJibYLOjBETDpZaX/F6Uo
	j+sztxv/itjBxFEA4KA+TpFmSTqQQZkoNfKyZAA4Re0hUDN/8pOlquVvX9c9FVU8wsZ34o7cl2G
	sdzo8KeGiAu4pPYRa1+c7uY6vWODItr8x4Vb3X/KJQargoS4X0kpkadv2fI/AL8vY3ZkVG6/KqX
	84ovHRrSiEVG+52ECH9lVNDH6uiEfk3QoSVvzs7yfq5QKQxTN8Tf5+3TQDJXWzfOPK8FcptOSmK
	060a/jhv+T2UM93N5B+Slx3XNATRzFP7jNxJr6c/iyLIWvvRvx49GY99/rKFyfsv0BzLsQSpThu
	LE/yrSALdig1x3i+lwFQRrG8TrjJmCKP4MVMJUPpxaMUH
X-Received: by 2002:ac8:5843:0:b0:50d:8d0f:a507 with SMTP id d75a77b69052e-50dd5baecb2mr162145971cf.45.1776013976542;
        Sun, 12 Apr 2026 10:12:56 -0700 (PDT)
X-Received: by 2002:ac8:5843:0:b0:50d:8d0f:a507 with SMTP id d75a77b69052e-50dd5baecb2mr162145581cf.45.1776013976079;
        Sun, 12 Apr 2026 10:12:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:45 +0200
Subject: [PATCH 2/5] ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3603;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjIEBMQ8waMqMWAZa0PumarSPjZYZOqQbKDr0oElp8s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KO10ougV1FJoMvqmzP/pO7HYyUIFjsgXMan
 6UvpE4W4sCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSjgAKCRDBN2bmhouD
 1ziiD/43A+Y5ILBAY43ub/OOhpW6/2Am4oy2oBK3PZe/MvPqpJ5+Tc6dtSpa45S6r/favOs5ijq
 ompsMapLtmQaCt1EIhOvjCEAmtPYvmSbBHcTW0egVOQ1awGTNyne0zEjlvdYxc1JWe4N7+6blIx
 7L8OPjtZKG0H5LIFvGgQGF8CokLW7M8ELuD6HvrjF6Vz+On8JW/YY4Qm+6ZObuA+Vp6J8EawHSU
 vcskD2KKh/jdfyau9mNWjdUl78fdPBZMYUJGliJ6YLZNmwbCq2TkNB87ErvtlY7s8oAH8sLhvN3
 mOv46TwLROZezfr5rlwvxOjUtrmanBcpVaaYJ6QOCFDhbig49Uq+hBvVehT/l6Ffs5KOdtfIlm3
 ej5Fqkp58OZ0YsOzlbq9zwzeyz+wCpB2xti16vwRtfU43dFdyyfFjC/honmDKa5nAVOCpcVbKd5
 m9ARPDN2/mnmoxziB1E6T684bG0Ggs6mxhkD+mqgndcHw1nCv9w7gk6SUFWE1B+hU3PGvWExBYW
 JAKwWDh2PSNeHqxx0MPjGyXUNCTmbz8js8HvPQ1CnyBupNBTngyvodDT06gFRV9MkkhRU1xkcHS
 FA+4JVouCgi5GL/ElG7gDapuH6vScUzAe/77ZrhuTowIkh7WuNAVWMGNESOaj+haHzYKnUEWox0
 3h6KVvevLESNrhg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX72BPcgI/C1iI
 FDErI9b40J2shkVRWEvjajc2ZySsIBUbCMQ+WW0gzQ+MOiQyErbts0KUNzJSCikvnrD8ex+hbmt
 m83sGZqdOD9QXb5qkzAbZbAnaq4nIBr13G98FuFRp4JsGkI8zp8VmMt/zi/xKDxSJsZnkp7xruE
 yoBXBr+3NPRJ+uYlpTYy8jSoKr8Lm/of+k4FK6PQx+F/U6dT5o93y8IxLgGP3Y+1wK1jWlrpRe7
 TnzQBftZNgpJVuFGWZXzkRImTrjCTwJDZxC7DP8t+2FVmpNRoiyA9p+gFXPNwd59vIDuYA1/8SN
 +J4FTP5K4UfKxBA7u47VSBxkQ2tkvYBWGNWSNtCdysfoVPfrJT4px3pVTLDrhlkvqYDGgYX1F2u
 TGcRVpxx5yPnEyJDW2Zr6ItwKW/XfyBDh/RNSr+WLst4eackhNlq/gwFghRwUFDFalwF8W/xr29
 q7H80YQeaDoUqSokwpA==
X-Proofpoint-GUID: fvgX9nlyJjtEPcAfJWJtRH2_JV4LtGkx
X-Proofpoint-ORIG-GUID: fvgX9nlyJjtEPcAfJWJtRH2_JV4LtGkx
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dbd299 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=knklNFjf03hsu1HMgqoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120167

I2C_DESIGNWARE_PLATFORM is default=y via I2C_DESIGNWARE_CORE, which is
enabled.  No impact on include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/hisi_defconfig      | 1 -
 arch/arm/configs/multi_v7_defconfig  | 1 -
 arch/arm/configs/pxa_defconfig       | 1 -
 arch/arm/configs/socfpga_defconfig   | 1 -
 arch/arm/configs/spear13xx_defconfig | 1 -
 arch/arm/configs/spear3xx_defconfig  | 1 -
 arch/arm/configs/spear6xx_defconfig  | 1 -
 7 files changed, 7 deletions(-)

diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 384aade1a48b..dde9cff951d4 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -43,7 +43,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
 CONFIG_PINCTRL_SINGLE=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c477454a4694..4f3d1fa99887 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -420,7 +420,6 @@ CONFIG_I2C_BCM2835=y
 CONFIG_I2C_CADENCE=y
 CONFIG_I2C_DAVINCI=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_DIGICOLOR=m
 CONFIG_I2C_EMEV2=m
 CONFIG_I2C_IMX=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index c51ae373ca88..2d5f5dfe5af6 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -278,7 +278,6 @@ CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_MUX_PCA954x=m
 CONFIG_I2C_MUX_PINCTRL=m
 CONFIG_I2C_DESIGNWARE_CORE=m
-CONFIG_I2C_DESIGNWARE_PLATFORM=m
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_PXA_SLAVE=y
 CONFIG_I2C_XILINX=m
diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index f2e42846b116..19a8e30a7b22 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -84,7 +84,6 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_SPI_DESIGNWARE=y
diff --git a/arch/arm/configs/spear13xx_defconfig b/arch/arm/configs/spear13xx_defconfig
index 8b19af1ea67c..6712ae741c19 100644
--- a/arch/arm/configs/spear13xx_defconfig
+++ b/arch/arm/configs/spear13xx_defconfig
@@ -63,7 +63,6 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_RAW_DRIVER=y
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
 CONFIG_GPIO_SYSFS=y
diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
index b4e4b96a98af..b96baa63fd58 100644
--- a/arch/arm/configs/spear3xx_defconfig
+++ b/arch/arm/configs/spear3xx_defconfig
@@ -43,7 +43,6 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_RAW_DRIVER=y
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
 CONFIG_GPIO_SYSFS=y
diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
index 7083b1bd8573..dba3bf3fa19a 100644
--- a/arch/arm/configs/spear6xx_defconfig
+++ b/arch/arm/configs/spear6xx_defconfig
@@ -34,7 +34,6 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_I2C=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
 CONFIG_GPIO_PL061=y

-- 
2.51.0

