Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3303B19A6
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777488642; cv=none; b=McOKU0cdEvjmUu6UpPs4X3wpNpxhZTmUSjL6sKbP9OQnZxDAHk2KH6B8/sYrxk1EpCW4id9szW+OYWvFQaPtY1GJvP4oe4G9m1fVkySypgBDqMotGZCCX3h6PCljFtakk3iDitTarb0FS6HjG1uxnEyUZo8xzrVrOd0HKQzq0W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777488642; c=relaxed/simple;
	bh=Y18lQeK785BUdXcoivL1iOwoR7xldMbNw4zRskgiwhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XzR7aTeYJThibpNBuiTodRE9KeK1WKDCMdtHv1bEPS0RRcuk/K1Y6jRiags3jmUB7XmDFNUstEbPdqcjKEGA/7noumKsJF+Fw2OfIwNMA7TQhvqwtHbw9KI09VbdMDaKXO8Cg3uwJLHdf0EZGryBcVXD6RDitTkbWBVxUraP3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCNkD/Px; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIdVfEvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCNkD/Px";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIdVfEvG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCeYQN317094
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	il7ZtFXUm/0VgwIneFEdIfwHcrPU08oUjosBQhZyc7I=; b=UCNkD/PxHOTA81YZ
	vTEqGFiFYyUd4PaCVW5jXI3fPazQE+04m0c1i+Ky87ktmVbr/qGX7K9XJrAXQQme
	OQJgTWm336BElEpXnN8VCLYPpwXOcEljF36Zy2GwXROPehj8cqtfhXOt8S5OArkZ
	nXfwPXSbZWty3qQ5MImDNnr4Kcr3xvRmnj/ksY4/fSyDXIK3CeMrlIthUVZB5oLX
	YEwQ+POWz8mp/E4skfZ2shdomRdnW6pjpGl9vmT5jbx2JPNPVoYAmMlQSjur+6H3
	URMvR1K3r7a2AVwkBtokSGUFjIdQt3LWpDDwF9IH61XqJME6roMqxPSI2kjigN1U
	qR2usw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t9g4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf1ecd1dso1546821cf.1
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488639; x=1778093439; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=il7ZtFXUm/0VgwIneFEdIfwHcrPU08oUjosBQhZyc7I=;
        b=PIdVfEvG7vkzLrPPobhqKNqAteFtJD44N8zdnri5uQNraW7KPgUvaqHydXgTYps/iB
         f8eCxeJej9biKlr5xGffYXTpbXdpI5XHJ716yGMsNdeB1RaL0QWXm6B2duQO9jxiXquz
         m0Yu3rzClANcrg6tVlhEFF5Ojk3ULAT0WtPYRfdqlhleRbyUPGteZ98Hi6HKaMrE0+er
         zdLsYc/xtRBlDbEJVY9y4aGO35mkPHz+jEt5tc3dmEpG93O6CtcPacECHajG5W7n3P4b
         i4s2tLJjdlWRRf45lRuH3vMM+rd5rb/8gDasPNC2PdVwOSFyk/BiJcjWVRxDa6X7FUnu
         Danw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488639; x=1778093439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=il7ZtFXUm/0VgwIneFEdIfwHcrPU08oUjosBQhZyc7I=;
        b=NwZZu+4KembcRxZlk4aYpaPvO9aa21BpTs+6d7JXDXbbBXj2tHr7EQCt79cFeqPtLo
         JjFhqtDOxMBhDUWC/zYL110Cdg++59GIlyuHYVkpk701I7rEC4tXIPF2nHWbOxYbmPU2
         1BT3KPqFxcse6B/Oz0RxMnovbMNxpx05KJlCVFKYMLhjaRil7YXcyUEOF6mKSKZIA8N/
         AZRYbjQnCj/YGn+sBqT7NpQRq4eI/xOlDzbj7GZxTSPax0IyHu6OTLLfIunqBQNFBiMi
         M17UUEq4YZ++rTubPDHZaXCi5iqEzS62V8/zZScPFBqh+9ztjWKHNper3iVNIE5jRUfU
         a0Kg==
X-Forwarded-Encrypted: i=1; AFNElJ8kTU3vRmUsmxsbuNcCxdyt8RmV9IDLHHRG1N3HUQrBFeZg55jJQ6/2bn/9qo1i/y9s50M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAR0VOtXvhKw2uk8/h+tBj5U+IEjk8pUlGCVVs4YkpFROl/bZY
	m2XOgKNkmgp8weJm2PeVrcxKe3AkKLHLSyVBnq0q5delTuR0DM4sHvMSi+TrM0k34dWH6YNrnd1
	VaIBRCMKf+JYm9Fn2+m3/4CjIGf/gvmvE2DOth5AteltmIiAFfr7H42M1IkOxISA=
X-Gm-Gg: AeBDietdOHkzb98I2tHmTaKU04CKAo8rvH4+IdZaXRqFz4pemUkqrNNqRzVkuP4ZJRy
	6wRAMFAKc1pCzOMD2u14fz+FlRN4+4zHQCd3AbhWUeR0S1jV3m2stZL9bFKkDFHe04IcgaRSOHS
	we/8eqsGUzYnB/7q+BjvU2rlbDjKjPp8yG7auOiwOwtAnhX5njIOFHbSyWhc42Xe3sFnsLm34CO
	m83jKFOh279WKyLwso3Dl9LIe9i0ZSxVQuz06fcssIdhSoxVkZJEx1i8p+Tn0Q4/GBlLY8F5dDv
	VPh6c5gd++eyt4zqhj4uKtnNQpqN6vGPVwE0XSgN6dSHJSBGptL8aAtFcw8Jew8/Z0IdkNxB92n
	fhqcnQu2AXENDd/0qpkRJeS8DvBaTdn2sh6UhpbcZ647CxQWwCdmC0R4=
X-Received: by 2002:a05:622a:145:b0:50f:bb11:df41 with SMTP id d75a77b69052e-5100e1f6136mr120912411cf.60.1777488638847;
        Wed, 29 Apr 2026 11:50:38 -0700 (PDT)
X-Received: by 2002:a05:622a:145:b0:50f:bb11:df41 with SMTP id d75a77b69052e-5100e1f6136mr120911981cf.60.1777488638429;
        Wed, 29 Apr 2026 11:50:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:50:24 +0200
Subject: [PATCH v2 3/5] arm64: defconfig: Drop default or selected drivers
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-defconfig-v2-3-e4ed4186028b@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3932;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y18lQeK785BUdXcoivL1iOwoR7xldMbNw4zRskgiwhw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lL0sgeXDSDby3iCOTPT8ih77bBMMdS9vr72F
 T9jC7nElgeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS9AAKCRDBN2bmhouD
 12wPEACV2nKntoCfsb9G+XLWmv2LbLw/iYIflfPo75L/dO8qFnTL+Zt1E/pSbXziYWTAbr2Bxc1
 wj8HYvHODhvFS6BXyPMVbQEtNO89II7vfpQYLF2Xxdw9v3rWCp3VvZ4nHiGcIP/HRB65mJ8EY9z
 frmOPUZSGL4gh33Wnc3U03AnkoGBLZpbE50pL1NyKjRgr7SZUn+3/bHqXGL7I7L9lr8Ajny6XkN
 xyZmJC3pTfRZPM9p4y7wcoH4+OGhO8/jHGWt9ICC86cqN8ToK3F4dIQl852Q6kLIbAGoTeDFBWV
 PHxLY/PwoIUTfaEMngXB3/YaWvjFP4AY/JVqEkrlKMgqWg0yFQQavGwDxs9eMBmsBhH1Z0E/vHr
 wymRFpFY7FNohM/wJxl+Iy9FJTZ6pbjC1TbaiV1/Jl3tQ3/f4ZEuVsZIs08rr8UvOOoze6TtVjX
 /pk0NfMSsPTN10nsSnU7I3grP7Z/re6eyu2o8OpxwVn1moNS/qKUUYlbdadvU18ZoXLk66IMF2D
 9mjKd3pd+Ol0FJeJr75YtgtxLxWxcnAqDO1Ds2DEiOPf63O9SXgCyYbL6TjCoFY1K00sxe3Nkcb
 WLu6SK1eh2BoIOyh2uLCDvsbI0JvYdUR0HRUGIAt9y/mXEUz4RW54a/PyhiDoe2KsshoGj07bcD
 rp6qMk/6LpIYGUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: wwoF2eLRhgqXuGPgKO7SKtrwzjHQkTF-
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f25300 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9vOstYy64hXmyjEA1s4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wwoF2eLRhgqXuGPgKO7SKtrwzjHQkTF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4OCBTYWx0ZWRfX4Mpz/8e86v5I
 jO9VoiNs63S3TH6XjepGgDjM36Z3wuLlpQyugJjCmrFdTboUsLu2mK4tIZQdt1Lel1iZvdv4PX7
 W0WReOQC92EH/tnoaSP9eC1XGbCLCgJpUWzBukOZsSx1YJxLoXPkfg+XHs8hJO07lkK25E7VOLL
 tuTxsu5H4MXfGPLqKgPKq+lpYOch2o0wSq6owBtZhJ8nwGR3vg7QwKCUzQxWo60Ho9dovxdNz8h
 5IIsYox79aSbsAXTlbb8hOJzgCe0aQ5IyxA+P3HA0snBUVMEX2W0nucExwz+2CUGJsvj7tom6fP
 oDe0+IRp7oJx1sK8PrX8GFvZjFX+1EGSgyvyuKDm4ZEcnsweZcOkT4qCOLDKt+eQ1A6Rco7mxmG
 bc9f7x94wWYOqvX1ugTwnSqfhBOaWwDvArfRApu6P09rv3rplYxvEPWapCcljId20N5A84cbxF6
 bz3fYfCPLEaPd6MmWHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290188

Drop all options which are either defaults or selected by other drivers:
1. IMX Pinctrl drivers are defaults for this ARCH.
2. RP1 is selected by MISC_RP1.
3. I2C_DESIGNWARE_PLATFORM is default with I2C_DESIGNWARE_CORE.
4. DRM_SAMSUNG_DSIM is selected by DRM_EXYNOS_DSI.
5. SUN6I, SUN8I and Renesas DRM drivers have defaults.
6. SND_SOC_ROCKCHIP does not exist.
7. Several ASoC drivers are selected by other main sound switches.
8. USB_CDNS3_IMX is default with USB_CDNS3.
9. IPQ_APSS_5018 never existed.

No impact on include/generated/autoconf.h.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9a31b258a56e..c9f6d5d6ef69 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -557,7 +557,6 @@ CONFIG_I2C_MUX_PINCTRL=m
 CONFIG_I2C_BCM2835=m
 CONFIG_I2C_CADENCE=m
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_GPIO=m
 CONFIG_I2C_IMX=y
 CONFIG_I2C_IMX_LPI2C=y
@@ -632,15 +631,6 @@ CONFIG_PINCTRL_SX150X=m
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S700=y
 CONFIG_PINCTRL_S900=y
-CONFIG_PINCTRL_IMX8MM=y
-CONFIG_PINCTRL_IMX8MN=y
-CONFIG_PINCTRL_IMX8MP=y
-CONFIG_PINCTRL_IMX8MQ=y
-CONFIG_PINCTRL_IMX8QM=y
-CONFIG_PINCTRL_IMX8QXP=y
-CONFIG_PINCTRL_IMX8DXL=y
-CONFIG_PINCTRL_IMX8ULP=y
-CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_SKY1=y
@@ -669,7 +659,6 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
-CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -954,11 +943,6 @@ CONFIG_DRM=m
 CONFIG_DRM_HDLCD=m
 CONFIG_DRM_MALI_DISPLAY=m
 CONFIG_DRM_KOMEDA=m
-CONFIG_DRM_RCAR_MIPI_DSI=m
-CONFIG_DRM_RZG2L_MIPI_DSI=m
-CONFIG_DRM_SUN6I_DSI=m
-CONFIG_DRM_SUN8I_DW_HDMI=m
-CONFIG_DRM_SUN8I_MIXER=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
@@ -970,7 +954,6 @@ CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_NWL_MIPI_DSI=m
 CONFIG_DRM_PARADE_PS8640=m
-CONFIG_DRM_SAMSUNG_DSIM=m
 CONFIG_DRM_SII902X=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_THINE_THC63LVD1024=m
@@ -1108,7 +1091,6 @@ CONFIG_SND_SOC_SC8280XP=m
 CONFIG_SND_SOC_SC7180=m
 CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
-CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_MSIOF=m
 CONFIG_SND_SOC_RZ=m
@@ -1137,7 +1119,6 @@ CONFIG_SND_SOC_TEGRA210_AMX=m
 CONFIG_SND_SOC_TEGRA210_ADX=m
 CONFIG_SND_SOC_TEGRA210_MIXER=m
 CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
-CONFIG_SND_SOC_DAVINCI_MCASP=m
 CONFIG_SND_SOC_J721E_EVM=m
 CONFIG_SND_SOC_XILINX_I2S=m
 CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
@@ -1158,7 +1139,6 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
-CONFIG_SND_SOC_PCM3168A_I2C=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1215,7 +1195,6 @@ CONFIG_USB_CDNS_SUPPORT=m
 CONFIG_USB_CDNS3=m
 CONFIG_USB_CDNS3_GADGET=y
 CONFIG_USB_CDNS3_HOST=y
-CONFIG_USB_CDNS3_IMX=m
 CONFIG_USB_MTU3=y
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_SUNXI=y
@@ -1437,7 +1416,6 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
-CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
@@ -1490,7 +1468,6 @@ CONFIG_QCOM_CLK_APCC_MSM8996=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_APSS_6018=y
-CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
 CONFIG_IPQ_GCC_5210=y

-- 
2.51.0

