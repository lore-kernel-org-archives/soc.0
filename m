Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E3306B1B
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013981; cv=none; b=OfKOJ80RUsKkT8WdiaxbQWsmqmSXbjG5qivTUMb74EPH/DjnPNbg4Vq3fmHg8H+3W7PLDKbxdJDsrsDNMh0k68HDwp1zPWoCdx3spwoEZv5JIGs3zu4WkxbZ8pWVSS4DOcnLH75jibe76H4n1g/Xrs+B6sMlqJykj8jIHx1Uxv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013981; c=relaxed/simple;
	bh=RV2PHCEC2W2QOfy1Y9Xpy/sCJdlSV1V6E9vi2fAesvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBvBwqYmoEE6vaQREyW6KesinPyhZVhvYRwZXYZPsG9w5nnLbVvHn0BtNZqCLj17rzW/zTCQFwHMQRJgZw00Mc6qLI+ObyIyRxFH4o9gB0a/SZhF3i79Bcptl11XAQewVGgnnsTusKSoFyOldFxvG0xCBr5ZVwXYMKvrLrssR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jppQqfv/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHQZNl/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jppQqfv/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHQZNl/2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5QWf2533851
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcDzNlIxPiZL0bdzdan7nhtA8ZUMs5VG9Gjq/1xDZdA=; b=jppQqfv/toEu7kEe
	AYpAuIUayMdyjsy+B5CNhsqcwtfFhYZEopBCP3B2DjQU6MF8TUJvaWNz3MS17PaV
	yhoeEfTYNikaWSA9LKn96yTc8IE8DeHVtgScRiqjzybLGp1h7Xw41zV6cILGB5Ff
	IG4RHq3KlBugp9/gG/MONvcer4DOX+dgLrkaGf6f2hFenCvnBCo/XVB1iXqrNG3O
	Il6PY+CcWmXtXmAAuxhJTova+fDaNj4DH4A9n2gSTncOmwmuJyNum3/ZKe6/5VDO
	xfDyFGSm9feC6cdNY+XJ1N2+fXO0FhNv0ndctjHVCEgGqPvO2WX988w65NKKIJGk
	rhU6HQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyytq2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5aa81907so86196281cf.0
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013979; x=1776618779; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcDzNlIxPiZL0bdzdan7nhtA8ZUMs5VG9Gjq/1xDZdA=;
        b=BHQZNl/2e6wX9Ni99Igyo2GToqyaXOH+blUGtV2zzlPUJyJQuf27TcnvypDFwmAWiU
         0Bo3OpIlW5cvgheYZxao24i6m/od97IqehwyzzQrJpS7rhVTZOXmBlZ2rTTfFLTJQaC7
         atnEJUEki6b6O0o63FdjhBynah+mTd3sLTyy/CUggfBf0tpeezoDhx2c2Jk5cg7DcDIq
         5Fk938FFyG9kXZ6r6BNFGy0b6hGQbpjMQzhanacKG96dKTgojtmvjEDg6sF9JFNB4Mc5
         dEjwRFGXwyKpfUSVCz9n1DpGV6rc9CN+jnQ5KCA/BCT6hJMd/x+3yU0IaZfzYVn/ZxrX
         IZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013979; x=1776618779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EcDzNlIxPiZL0bdzdan7nhtA8ZUMs5VG9Gjq/1xDZdA=;
        b=BvU1UiNW6cc3n2ln+ohbbAF5Ypr8QEcIS66IQ56V0ywzBBJvctJbwKtg70h4s7DAh7
         KjQYgV9MdBwR0wFT4GkB9DhTimN3NjOglknorG84ttA298sfh42DgcSnBOS4xuoetuwv
         5HQfio7xuqvbqNgmyeB9IvBf/iS702DC/7e+TCsvkkdiWO1N4IO192FvA1Tx+Y67mpFV
         MeOHPD/jv7YTilPpCVXNT24DwBCYVmtIw98rFNS5aunnXsBtpHMVVZ/r3QdUbifJkRkE
         jfh1MHVVZelZhLgrVWLAgfaVOfeOqD++cHj/kftAqVwhrjPWCcDs9XDORHFb1Pm8abAc
         6N2g==
X-Forwarded-Encrypted: i=1; AJvYcCWY6lio/c2rmpBuSprJeIfcANDzMrpiTjA50xfxI3mEu9iy7NecQItjbY+fkUjLvRmHwSE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5R454REsgU5rMpYxQ1c1VOFSNq5WP7ri1rQZO9ilmTB+LudeL
	mJM5efOHxTzOVLMP8J7NqO4eG1AS7WJXc+980PPvs47eytnrzWUEKHQvnNYuFR1Zj4PgBiv8uKU
	5ZLRMsR3V8/A6+t3QEizGHY5cBbyj1sXJkWVDlnOD3hUgjCcIRetXsAo=
X-Gm-Gg: AeBDiesf7lSkMLXkMoIDze/mdzHYRxMZSGgwPpqUKWO1+S4umU7r/iyFD8ubD0w7Lr5
	zzUpjdZxErqfNF5HpS23hnDDjYehHGTit+C2JHvhzu/YeTwVv6Bt/VDCULVFgs28Re6nrU1h4nN
	douEU08EE1t7f4yCTiK50sp7Y9XiftucA9illhP+iK6StsFbzkJZ+fEupveyHjQhvDGOhiFbJvb
	2iJW7CrZJ6wWCH4FgFiqEZdyLrPeYHWllIetyX3s0ZJPmHfXu1CTFiNLHTVM3O6CmfAq+FxC4Bs
	aZd531DNH49sejh0xDIv2cscM5JZgBnVtHXqPmTbC/ZERjwnxs9z6w9suS/Ye7yT9VPKJJgNLpH
	xApF3lIzx+qm19cPLRxNYW30yBFWsBl9XMkd0tK55LR+2
X-Received: by 2002:ac8:7e96:0:b0:509:18f4:6dba with SMTP id d75a77b69052e-50dd5c06e71mr166398471cf.62.1776013978550;
        Sun, 12 Apr 2026 10:12:58 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:509:18f4:6dba with SMTP id d75a77b69052e-50dd5c06e71mr166397931cf.62.1776013978125;
        Sun, 12 Apr 2026 10:12:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:46 +0200
Subject: [PATCH 3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3188;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RV2PHCEC2W2QOfy1Y9Xpy/sCJdlSV1V6E9vi2fAesvI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KPevLw9vxMj22zUSSukW96/FY9RwLVpVOds
 SUeFeLtVnyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSjwAKCRDBN2bmhouD
 16udD/0bTYSk4YdtCF4T2ENunVxDwYoeOFE90kATLJil3r80Die8ZHP2C18dedZn6GXgI5YProH
 SebTpZ+MWTfexKIfFSo2cA0KvZfWnonteJ4k9EwStL7599/udBG/gCeb+ZPIEKqkwumipzDqr9P
 bsf3bSYXJEiPqhnamsWP9o9PUdLBQbnKbOziYfQ1jk5+qQERvMvEPX+oZ6VyRzf8j/AJtQDJAUV
 cgHQ7IU3LVgqCbEu6nR2qTqAP7B+O+JL5uphOZnuYC/sdLIJhX64ocUKhoDsu53zfpE7LVctAuO
 OdN8WVGgvIUQjrb7O3MF/2YRWAgMIPhi9Aq2fjkWfdfqFaqKZ5g9meoQOTCnHhnUKdNuBolfr47
 iLzHXRu/xanQO4CLd46zCq8afbI29UROmla40QupRBHuPh8IKDnBL0vKYaQglHoMB7SMktQ8Vxe
 9iXAqT4Jb1rSnWIcP0IhEQESy8VxFIw/vmLW8zxSnLQevVXvtLvscqIQUQIe30JnN8C41GOrMbC
 ebVybSKEbYjyR90n97xte0QtT/sx3zvRm3Wozy7SMXw88xJPff/8BbBqOh/EYm8vrtQItPSK78d
 69MoI5OJ8/HQPAhO34tMT4yh2jL14GHN24OWj4ahlEItZFQbksqzxcXK+i88vbNU8hXGapJbbag
 lBXZ0VA0sqcju0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: egdWHAmeP3d6OC1I30_ktwgzF0wDRT-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX9I28gwnqae5n
 hZY2P9AJnhJEM6IKsRuZv9WMyxWT2oY/cElJ/xmhcyOADEUcICtKNhVeGpl8QqD47qgj6zpWX6R
 BSYdOpEEBm+S2hu4WJq8AWE6ygBlV8nSrMFKrAOYeoZ4zKWbAhNMjIEoiH5sfx12/RAVXcbHy+v
 gPq87NyNJuMJ1kwMnl9RSV9kY52Dgqdo/1uYfsdOBAolLsjT/8Meq1R8YoXa3MjmrxrnHfpXyzg
 aM4uL5SacLJ1LDzXF1L6baPrAbWLAbj9wvt5wFtsgIf8ljYuv3+ozmp4yOdFajLIXVYmXTlza+w
 m50lu/IThJsoHS7fjy2zaewoLHOSHTvHdNhxLAa6Vk4ltXLjQCgEAwCSym0yJfv3+WXV2m7ohrn
 4NtZCVGRyLUeC5e/JOuQ2Bsc5VULykCQcwoiUz/gQHsJqu5VLAcP8+Tiut2z9kW9GUw04rM3n6Z
 B4O6sdvd5lvEnUNGOuQ==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69dbd29b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZQtQTQ4zVFyU_Biz7KcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: egdWHAmeP3d6OC1I30_ktwgzF0wDRT-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167

CONFIG_SND_ATMEL_SOC is gone since commit 4f30f84feb77 ("ASoC: atmel:
Standardize ASoC menu") and can be simply dropped without effect.

No impact on include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/at91_dt_defconfig  | 1 -
 arch/arm/configs/multi_v5_defconfig | 1 -
 arch/arm/configs/multi_v7_defconfig | 1 -
 arch/arm/configs/pxa_defconfig      | 1 -
 arch/arm/configs/sama5_defconfig    | 1 -
 arch/arm/configs/sama7_defconfig    | 1 -
 6 files changed, 6 deletions(-)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 4f1153098b16..e331242dece7 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -155,7 +155,6 @@ CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_AT91_SOC_SAM9G20_WM8731=y
 CONFIG_SND_ATMEL_SOC_WM8904=y
 CONFIG_SND_AT91_SOC_SAM9X5_WM8731=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 59b020e66a0b..d0aea907124d 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -186,7 +186,6 @@ CONFIG_BACKLIGHT_ATMEL_LCDC=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_AT91_SOC_SAM9G20_WM8731=m
 CONFIG_SND_ATMEL_SOC_WM8904=m
 CONFIG_SND_AT91_SOC_SAM9X5_WM8731=m
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4f3d1fa99887..4032bf20625a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -818,7 +818,6 @@ CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=m
 CONFIG_SND_HDA_CODEC_HDMI_TEGRA=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
-CONFIG_SND_ATMEL_SOC=m
 CONFIG_SND_ATMEL_SOC_WM8904=m
 CONFIG_SND_ATMEL_SOC_PDMIC=m
 CONFIG_SND_ATMEL_SOC_I2S=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 2d5f5dfe5af6..6bbf40d073ee 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -403,7 +403,6 @@ CONFIG_SND_DEBUG=y
 CONFIG_SND_SEQUENCER=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
-CONFIG_SND_ATMEL_SOC=m
 CONFIG_SND_PXA2XX_SOC=m
 CONFIG_SND_PXA_SOC_SSP=m
 CONFIG_SND_PXA2XX_SOC_SPITZ=m
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 2cad045e1d8d..bd7f0b5f7d66 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -168,7 +168,6 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_ATMEL_SOC_WM8904=y
 CONFIG_SND_ATMEL_SOC_CLASSD=y
 CONFIG_SND_ATMEL_SOC_PDMIC=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index e52f671ccec4..47abc56c40f5 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -159,7 +159,6 @@ CONFIG_BACKLIGHT_PWM=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_SOC_MIKROE_PROTO=m
 CONFIG_SND_MCHP_SOC_I2S_MCC=y
 CONFIG_SND_MCHP_SOC_SPDIFTX=y

-- 
2.51.0

