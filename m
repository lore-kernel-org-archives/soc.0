Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AFA2D949B
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010890; cv=none; b=bLdABdcVj1XXiImieX8LwJUtUsEfdWHViwvRONqAB8A0eXfPrKnnOqAIygWsUEKM9xyC0927c7U7FlGX0T3EXpRpWuSFF1csccDIpTf01mFAsdLTKolY7PI9U1pNkqaeAO+Q4vBhNS681XvU9itkTAGxpTwGyLqpySjpkz2T9iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010890; c=relaxed/simple;
	bh=pgAv0cSIx1zTjEIDdb10mLlKxfNT2wuMo6N8m/X1XEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4glWjgVHJRZwdmvf8BftZ51VFUYTHopENTtK78f3KO5VVQaXcUhttXuUT45r61WSv53vgingy7Fe+F3wC4NcEBOVRbnoaSgAnW6TuVixyfY95S2KuRQd4YRkHXpUL/+ehj3BZ9wr2zc77g/T/CyPs9lpF4Dwz7Xy1PdWDH1IQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Atlz/V+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LE/V5snf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Atlz/V+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LE/V5snf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE52Y22533232
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clIhodCMUSi9bIWR5iQaOBvPMKBtZXbZtJjnqveYN24=; b=Atlz/V+bhi19AuKd
	DViXUmC1mxRhdYsBrkOfdLNzMdR2EtblA5w7T/U/J3a2KjGgxSIl6/IxcLqmL3o4
	JUZ0scOAOHjaDFej6wTV0opArrwkKFJfM9CVcakTuMr0QoEtIX9n6dBQ9DrDPQY/
	Lc7ojFJFb2oFRMRokTeJJXqqFgWSYoXjY/nCUHWfRptJhXkmAdjY74gjpLMmfECB
	f6wA+NhG/FVpMzkefaYStU6N+QuzOEMPMw4kk3idOkFTTJm0DLsuj2F1AtCGIbW5
	NEQWc2ieHVMPhllwjc6/rf3ALgZX0rJGjpLc6igeNnLMNx/LBQfkLYxm1nnL7Bzp
	oTSjXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyytmu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 16:21:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca6f796d5so12749826d6.0
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010887; x=1776615687; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clIhodCMUSi9bIWR5iQaOBvPMKBtZXbZtJjnqveYN24=;
        b=LE/V5snfwKXhvgqpBtJoR2pwS6cDCi8e1ViSeBWIwvAJycIzLs+Ai94IqqXOiabSgQ
         DKSsTEQ+OYccd+YiFqKIN0vvtQ1LfejVjiK2PuBSb+Q+WKXqq3h+7BPWJED9LkbNmz/E
         Sneh5V5dmXiDfFqV+30Y5MCusPNTKaJmdcyQJOiX2Ru968mPWXTLZnbfgHHR9wdffUlB
         JwDuE5JiIVnUQQXx6djJtR1Tc+N1L9FxgVsdLESXAKSlXINiVler/9LrGfLRXlvlUu+g
         X/Mku08NIXY4uE/F40fYUn8ax8ghBfkzzOxHqZFHLQzQ4HYslZNyysoF75l3l4p+lSk6
         ihQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010887; x=1776615687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=clIhodCMUSi9bIWR5iQaOBvPMKBtZXbZtJjnqveYN24=;
        b=XGFG6N536raFcjAtjCDNlwTtA5rfhgZlD66EKLIoqml4Sh+dUvY3Mc7gIi6eXQlYcG
         JxjmwL7w+5rzK9Xn5w/St7SCSrY/2NIRB/VC+is3eK8CycfU6o2p5cGisvNL8L8A7c08
         qffSlMD4j86ZU8z9P6aO0yfnZVj2F0ExH3PoAx9epIQVwFBuoSMuhNaJwhqtTeoi/cBy
         aA0sDbel0h7XT6zo9bP13VMvPiZC4HTPi32BLRPf8Vn8nyNTT9hkagL3KEon7098j9d5
         dSV7y2WFqQBaPlJnh0c9Gp+TSPGdfb9Zk3KPX581DN/aLuh3Y7Uw1Z/NGudqzl5uNaHC
         zYOA==
X-Forwarded-Encrypted: i=1; AJvYcCX2A4p14sgZpYsCMa+VFI8VkPH7n+K0UrqdJ5fs2kIACBcjcjxE5uvUwDfTfDtiz3wOgJo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRQUXr5DlgXKZHrVdmsyvcMNe+bAaa55JeU4qbZQAbNi5MCOGO
	2kJQW7UIlv6fEuGqJ82DJUyo+0SJjANI7p+Pe5CKP+da9JKlhF2J/LrK/OZ2jGiJotyQaYyCOgy
	gao2zhdanaom9iFoY+cC574LfwTZwf9nEd4MtmmWvJYHD4TFc58ayjz0=
X-Gm-Gg: AeBDietnyebDfiLogng3vfnpFwS0G172h5y82+12iym/O9Vh/MLLHUi5xwnXJ0PpqUT
	Q9+Y1tXMD5NSFvBRhIuDrgbkg4fIyoIvCCyMYp2ty4xthm+xgQtmWxpzmUYcCNdBT7OKkFhsO55
	cbvJ3TrImX82LlI4NLJi5ykdUQlCdYbT4AYqytdyaehOZ8wQ5xghaepCtv8eOhPB8vUNeSe18EE
	0OiMn8TL9WjpKldH5/yAFbDd49tPyDWb8+2eZqzjiBBOft5a957/xpm/i0A31RNgTA+FPPq45xq
	2c1zh6Ntd2P3FMmBq76cO7UMnn9nlQJzBKEyzEv5n70oqRHd1soUhTk2amOKUwNs1yvBD3N7OH/
	WQQaFpS5juslAD/fgG7JhUaaTyjmZzNRQKXy7JMkM8IJY
X-Received: by 2002:a05:622a:138b:b0:50b:4309:6c63 with SMTP id d75a77b69052e-50dd5c5ce1bmr164186571cf.46.1776010887419;
        Sun, 12 Apr 2026 09:21:27 -0700 (PDT)
X-Received: by 2002:a05:622a:138b:b0:50b:4309:6c63 with SMTP id d75a77b69052e-50dd5c5ce1bmr164186071cf.46.1776010886952;
        Sun, 12 Apr 2026 09:21:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:05 +0200
Subject: [PATCH 3/6] arm64: defconfig: Drop default or selected drivers
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-3-a46918286451@oss.qualcomm.com>
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pgAv0cSIx1zTjEIDdb10mLlKxfNT2wuMo6N8m/X1XEU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z4l9NwFSy/s/Afe2RGttvFojfyGvJMt1vso
 fEzTEVQWlmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGeAAKCRDBN2bmhouD
 19grD/4jlMTVNlRDfCm0k4nXh/tX4RZvoVIfoWzpezlPBWtvZ0NQWdwRvjJnNmkV2C6Svtuverd
 UWr0K9yl+PZAhzV4yeqVOymOrRR8nvo0LwF8BkcDGe0CM1TiZUzmq92QA9lng/s98+c2QMSPtMP
 FWs6MEdefIZI/VcXiyndxvzsOaOy0Ha1xjUjjDorNH1EgmpqXz7HjKgrmOYv+LVo4EBE1lS8GUs
 YjJ0K5NM9lBOKXCE1EVBSG1O6GcJ9bC+32L3sxV1YvFOHT9m6CUlQ3fcV2RVpvSuUjok92UQr9b
 lk8WWaZsXWopzWbFTbNwKXAbYeCjjB+ArYinY2o6Xp4Z81tqXFIXJpQvzYIDK2IBwduhyNxmDMd
 AVRHeFyqw+ul+e1Rk8W5x55KDIUt3admX92Cd2jIs8A7NPg7yQJUYf4JTOynQKMEDAsuKgYODct
 NTfbO/7+a3fPMbfJ7aPMSeKevtSpOt2DdxvNBgscFqsxSMOswmABcpmgfMv+qxj3Sz4jz8j7DGZ
 Lwp8Qfwhc6zyoiTyPbkEU4rhcRNh1gj5TUChNkgpTDBX5mUiIXXPaYGtCZGk2oGRzs5WlhY3IzA
 g7BZY0IeKE7x/WNER2qsD5Pmh7+OgUFiEQcIoDgO24T+/Q0IKwnz/YR9MraxkvX1Q0ehmeEC8mP
 NjDw2asnhtOoUKg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: W8lubolnwqIOd7_zGFfLZ1u1dD6QlvHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfXyfNJH+sD5QFp
 /sKgacLY9xgzwRgScYC/ITFrkUtTSMGl9B5l3fsKrp9ZlyYxWucBmHZ8nQ2+AO82UeV5ijvGbda
 H0TxSMqXsMPwKPN8xosMNTkDGh8fHWjPW3pWxzBg2PqA2VXKbQFDf1xWg+0eQi++sAUbbJscfz7
 lgT787izWSdeD6FqLpaJtywAFGwbzBdagXZkjSDFCQLmU07+poBa5Fi+IAIL2MfUmbCJGDr0FqG
 g/3iihyY/amL7o9940SOkqz7lVnjXKPF2l1qLFi+BmnyeNAmdS1LuW1yuSnC6pRk44b+C1x6mDO
 9MeWBkttrSJapnetMhMe7zIbdEtQVOpZfS7ddXM91AcBODFjGERBp1ZLmPn93khAGHhAXs9gjRL
 ppAhdVtNdEgav7tkRjOOPZZ8MquGRJxh23RyY0OTAHQza+XPM32JOc0S1fJs5BgatheJkk1xYrp
 09sXF+DI/vtlrompeeg==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69dbc688 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9vOstYy64hXmyjEA1s4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: W8lubolnwqIOd7_zGFfLZ1u1dD6QlvHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159

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

