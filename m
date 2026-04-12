Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBCE301472
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013983; cv=none; b=bkBrkIeY/NYTl+eFOJcMJTfe5tpeEf1geGLKXFmWEdJcN7FEskoh/3DNtFICukVQSQ2IQ5cdiLgQfOQpT2BpFP7Ymgb7r2KN4eT4iyoucRL5HCZiyh+p56hcYrYCVDqXoHLyA9PkmqAmvx8GLlzBiMh82W85/KWTtuVHOjJolpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013983; c=relaxed/simple;
	bh=gS3gQyTEEQDQLw3eknJCWE0NanahznRn/PqRqyF5SDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipNGjicDTnCa92zAua+uCkAMUH7tYBy2OqnzgCZYkuKfUjkSeefFne4D1cUxlnkHTdFI3m1cH6xiUqyYf2XoF/5mQtBCGZ7VZBpByOGDf6NIdpHBrXefCaGjRJLtUShfrtgV7eavogVDQMt6WFBSnFUbJKYuhtGoLZDS3/gDrvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5QjAkl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9skAyJi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5QjAkl2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9skAyJi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4jav531190
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXtdqQ9gBJK0c2LGclVO5rctZAjxvI989BiAyPOViss=; b=n5QjAkl2eGuF4aMU
	THc4x98CWOeQms/N6j+C0gVH9iUdWDXJtfuM60xxQHWHrFB73A+H/6kUKP1cgqL1
	byurZ78hLpVUui769k6lDOMCCHWC/F4U+8TpSP3FqJoDy5xDRL3JY0AfX9p9lJ/I
	6Ep82VeWb8luHgSycf0X9/ag2IGxT6JQNMLv34r05RNJeZOJwn4Uddtyf51R6kWk
	3EN64zcRLh80NYFd+qr+OybKCUbV9S1YcEps6v6UaNRGiRB/Bz6sTjj+hIZvAdOL
	dUGeRhJPnBKM8YFD1f0fQRW5q4K21TKC5euTIHB9vI4hEpBBm5q2ysvwwDWJoHIx
	cWQOCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2baq8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:13:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e4c29caso91547631cf.0
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013980; x=1776618780; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXtdqQ9gBJK0c2LGclVO5rctZAjxvI989BiAyPOViss=;
        b=I9skAyJi5vx/reGLKhzYWv4Q5Ve95SDB835/8o4N5pQbU809Bt6aLO5ZQZAriUT3fH
         6VniAoPFafEkLREYEXibQu6uRBUMvXcydqo+/0k0uJkYjcWUeRKVz1atVB21ZT5EKgJ8
         begDxaP8CqY4lM2BtTXrd3YxXdtB7WHDmrSzsPhow0JSy74yWQam7J2HwnybHxylKz7h
         XRpGgaVMZs0CN9R8Osg/hi5aSXFP8FQ5UVRMlW8BcKHG76tLKCR+dCypoYEcNUSfvthW
         KFpvPS6NMVB47LHUlM5zZ2D69ZYxxbJPsVmlBMCzweeeilq9YLmvUyIBHJYRxbV7xilu
         qKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013980; x=1776618780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aXtdqQ9gBJK0c2LGclVO5rctZAjxvI989BiAyPOViss=;
        b=JhaorqB90+iD6T1Z8RBpsl+KHZhkKDGtWGdMrZ9CMIykyl4QWrIm/dwxF8DE9HqKHl
         SXD/Ut/Ja4lgY/IPt1+tQXXAVzJZ5YhyWPNoHXtCQd/scxD1Oe6DN4ayvQC31d7F9oNf
         1zB6RRXbdSvaAMWtb2yaiwZRQMPaMyeMRiLIfxhQb+oEmUL/C4Of8CtQUvhYCKpaM9JL
         Z5MFeEH5WriEFAA3N0XuGIhwTWXnZy/QEF+D/B5WVfJ3JyUKNFxPN/eq7iwOsrOC9d2s
         LT7OkIUNHYxXVpQVMx9S5Lz+46Redb9PLrZssFKREVIjzZaG80VYdJz0qHr88vzOsDts
         GzYg==
X-Forwarded-Encrypted: i=1; AJvYcCX6IKMdea1xjOKmL7vCbdoMLuBYTmKKpU3QjjQF0U/s4hW+xcgMIMEnXhefIvKNkm2dPlM=@lists.linux.dev
X-Gm-Message-State: AOJu0YykPHf8D4CNHec5eTwwmwxUkm2SXy45+i6AlffPsHHCMaq/0Kg3
	zIxUcuhzQCZAM9S+PLHllov/U/wSGbwROHzg7v88KIj4r4VWvBkp4Ie9De2ozqqRwzrVvaMJvOK
	SVddrv2mB/Czp2mzGDju68ouNRHpnuNeAbXnwt5eCgHbpbN5lYEDFaVY=
X-Gm-Gg: AeBDietiqBLClGgGh6/8X4MVM8LSuPCCEz+nXJ/9AqR1s4Rl1nmbdVK5AMup6ZH5OG5
	uNucFIRh2dConlbVzcM3o/B2X465QlqwjT8l5PrEWxd69hv9PGTvVukS0l60tKVpW/J3w2kCLN+
	5ET7cd7qbCiSnZz795tGHSPVphY5IbcDjPO38k4yiDObGXqculWtB7nH4Rdmdp25xpw2IM0PUO0
	MZ7RjO6ye3l3r3splvxHaUe1j/PSK+xE2bVMFhPQ+oQLjI5sT02ikskvst9NihY/4yWzRn2qxj4
	fPgpXXNYUGQJvuyXt6YLOCihgOb0EfF9TkQ5S8pb4/iQ14WaIJCnsFn4mfh+tiGdInMXlLtgniw
	PmHaurF4WScFmQXZLQhBws4BpgPheC705s6uRnI+Y+BlI
X-Received: by 2002:a05:622a:4a88:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50dd5cae418mr158228431cf.54.1776013980560;
        Sun, 12 Apr 2026 10:13:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4a88:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50dd5cae418mr158227991cf.54.1776013980110;
        Sun, 12 Apr 2026 10:13:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:47 +0200
Subject: [PATCH 4/5] ARM: multi_v7_defconfig: Cleanup redundant options
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-4-e76de035c2df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gS3gQyTEEQDQLw3eknJCWE0NanahznRn/PqRqyF5SDU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KQQMj2gHAhKkq4zJa9tmDi0mYIFjdxv+UKa
 PPbjiMWSu6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSkAAKCRDBN2bmhouD
 1y6JD/47abvJ/C0j6buMufC7kTBHw4zcaMSiH11DLR4cAeZNZYYdzzkh8PDkEfLOFkZI4GAZXxV
 oa2K5RJ5u/0kPU0cDbgYiLH32Ck4zU/jo7u3EatmzPq7N7W+puLroX/B8vKPMChlucTi2qMlSZL
 KqCgMMPX4PmoR7BRr+5Ynb2xFZf1CwmKYHtB2O7T0Gtm0o77XZvSeRcl51FPhbNVMA0pMC81ubw
 /OvlsJ90+d00cGtAvpy80uPG78EtA1xptpx/bQlK+Fc8cNB8eJNzE5uinGeZclUU9jTk4zdMK7i
 /FaHDD7fvEPZB9LQt9rpA8j4JtnPFWbnRRoPobXBMXC1e6YPkxJPFH2bs8w7ubFLCC4L6Clm9Gy
 y371myM5cHA3+pjIgblBkqxXQOSEKUd4ZLooEXdXkxcRbb8CQJ9Cy/FmiyqiB8QArfRnSDkqcU8
 joVu7DSQkcW96ory3QuCFslvUMRVcFWejEUPFXOgNBe5yrHrnqRljXSVpLLh+vHOy71sn1gfnMb
 cyvDmzeRT+2mdQTfJetXKDTNzX+1WDb40vCBon/fkiNSvyBo7zKWRyyZV08mpq5lBagp+Q1GijN
 aiblBLclJ9YxQ+i6ek2FFQnVcw+kPvSwcF/WzCVtnQVnb4fkEJt02IPy5V9Vvl+MgxSz4z5t3s9
 M1xMLaT/csXybTg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX03oXpQt0RWPO
 xMyOYHYa1vd4oxPTN9dmQulwLW/x8162RJ2CT5e5qJECCofi8sK1PCfDy39y4pXctaHi4cc/sQt
 dLnMfQ1nzsK1zgevraswPdARX21y1zqXplDbOJDsq2HIQbvKbkJX4ak/IO3cCmhBgG8Z4MHFA0b
 KO72KG/HSch1yD8vAi3NJ4i+KuwwRC1eUYHxfNdRSyyWcZHcTcYunf7ga4zP/nkcdJmK8fksW+Z
 U1irSLwC+NOwEZfB9n2zgYCqt8EzivNfXC2H5qa3DVpoaxollUZzi/+JN0b3bNf+yTnnG6SUhFY
 DrOInhydvAy2LFcIFwARqeQuSlw6C/Wsh8K8PC1wjgn2CXSkFbtzAleFxfYQJJjCwTkjn2WPs7e
 N84acs0c3bggWBriIeuPrpi+25GNggtQ+qX4ELhBlJO9BsM4R5wHMNhWcLlFfv1SSHs9AoDYBGT
 Qs+g+Z+4RmT+pI7Ofvg==
X-Proofpoint-GUID: JbdN-R4i3cFIiAn9whu_LOtrtDana_Bw
X-Proofpoint-ORIG-GUID: JbdN-R4i3cFIiAn9whu_LOtrtDana_Bw
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dbd29d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9NBflued9iuJHBMiackA:9 a=QEXdDO2ut3YA:10
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

Drop all redundant entries:
1. SERIAL_BCM63XX is default=y for ARCH_BCMBCA.
2. USB_GPIO_VBUS is conflicting with enabled USB_CONN_GPIO since
   commit 0ce0f9d0785a ("usb: phy: phy-gpio-vbus-usb: Add device tree
   probing").
3. SND_HDA_CODEC_REALTEK_LIB is selected by other codecs,
   SND_HDA_CODEC_ALC269 by default.
4. SND_PXA_SOC_SSP depends on ARCH_PXA which is only for multi v5.
5. SND_SOC_ROCKCHIP is gone since commit cae3cc435db5 ("ASoC: rockchip:
   Standardize ASoC menu") and can be simply dropped without effect.
6. SND_SOC_TLV320AIC32X4 is selected by SND_SOC_TLV320AIC32X4_I2C/SPI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4032bf20625a..520e2dea77f2 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -387,7 +387,6 @@ CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_VT8500=y
 CONFIG_SERIAL_VT8500_CONSOLE=y
-CONFIG_SERIAL_BCM63XX=y
 CONFIG_SERIAL_BCM63XX_CONSOLE=y
 CONFIG_SERIAL_XILINX_PS_UART=y
 CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
@@ -810,8 +809,6 @@ CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_REALTEK=m
-CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
-CONFIG_SND_HDA_CODEC_ALC269=m
 CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_HDA_CODEC_HDMI_GENERIC=m
 CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=m
@@ -824,12 +821,10 @@ CONFIG_SND_ATMEL_SOC_I2S=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_IMX_SOC=m
 CONFIG_SND_SOC_FSL_ASOC_CARD=m
-CONFIG_SND_PXA_SOC_SSP=m
 CONFIG_SND_MMP_SOC_SSPA=m
 CONFIG_SND_PXA910_SOC=m
 CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
-CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_SH4_FSI=m
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
@@ -871,7 +866,6 @@ CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_STI_SAS=m
-CONFIG_SND_SOC_TLV320AIC32X4=m
 CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_TLV320AIC3X_I2C=m
 CONFIG_SND_SOC_WM8960=m
@@ -931,7 +925,6 @@ CONFIG_KEYSTONE_USB_PHY=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_AM335X_PHY_USB=m
 CONFIG_TWL6030_USB=m
-CONFIG_USB_GPIO_VBUS=y
 CONFIG_USB_ISP1301=y
 CONFIG_USB_MXS_PHY=y
 CONFIG_USB_GADGET=y

-- 
2.51.0

