Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532C13FE34F
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777488644; cv=none; b=Ez+hOodrv1Opp85vngK5LeuleZ3ukPVjnmO0TE5BvkHcMqhhMIItU2vLm+ZJVS1xdEt7QG0znVqhJx1txH5a34mvjukfhPRjWB4XNx5SHUHRLLGMlSCyMTGYlaD5JHd2igDtbsZ4USfjJbfsKeJNMZ8jWu6Fda0J/OWDKgCMPIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777488644; c=relaxed/simple;
	bh=IxeH2edhasWmVeNbNp/ezQYnOKLSvsnMrG5M06jPP4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hk7j8cERGjVeZ5Ecy0enFavgfeexkSCv8BZafxYM/TbSChGKPVD3WY0C8eGKGV+J/hoUACR5qbKVgOwCg9RYFDvmCJid1ftbqSl71UH5PhVM+laQfGznDYOXcn9cMQ4m+ZZdxzK4mMZezH0WscF0ovWqjJt+MUjLSyv4mMWjuoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WG+ubWDC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRwxaipy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG+ubWDC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRwxaipy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFeCEb901572
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXz/IqMsYjdHjJW2RWFqUY7tQFXb7IOjqpr3NxxNnAs=; b=WG+ubWDCLBV9atH4
	jJZUUQkX4eZD4jZsa6peviRolB6SXgUS61qq8nlbvIAS9+Zj2TwnsXX6h8ZL9vU+
	MSw/bvsQyo1cewiHfGjfvFEqJaEnRR/E2wVKBejayNrdPJvyR+Tb2SRtmUf+0cAd
	rm9SQLnJQNKWS5+x/ndLMN0N2n2N9hR1RnzQlIeFg1BXNb/0EeA7OfZVlGdioYrb
	XdbdU7OUkjsZIRIHy1FIociqVuNgmzaLSrJXyDQw+8JRXuHMLjqYz0Vx74X/81Bz
	Q6pLU9/Nk4adeuPoU8Bfrnj6MsVyWgzSx5ZQhh6FqOY+1bWgL63lnagL7+Gnw6+U
	mr+Lbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9k74d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ff0bef198so1052331cf.2
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488641; x=1778093441; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXz/IqMsYjdHjJW2RWFqUY7tQFXb7IOjqpr3NxxNnAs=;
        b=FRwxaipynXoQBUe0Eygp3msJnqDjaGlKxzDNhT0dZJsdd6AQ1ivGZXo6zCXijKTBHj
         t37WLv80XqJZe0z9nBLAQ4Sfwwdf7yizu+4BMbdI/rHmR5GLmKIbUCWLXVylSJ2zUFyB
         72I6MliC0Ysn86ObF9ouD9sFGEvYvh64KbKv2cfFlQMnMoYtB6TFKK3fJu0j0STyP8mR
         bNN1bXRE7cwLd1KtnyQkzFtEXwua09aBKscO0rRatgxUZqm5Yfls9Fe55hOUPad/Fuvi
         o0lRS3we/Pe6AW34KRVMeyP/PW89q8E27zhJ3DlCV9u4Omngwtj99CoxuNkKvx19umHB
         fOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488641; x=1778093441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXz/IqMsYjdHjJW2RWFqUY7tQFXb7IOjqpr3NxxNnAs=;
        b=mjpdQ2BH5dmINEthQZkeOulPR/V/FQkcpahfglAzJQG6OGX+0B4ScGj4/iDR+LyHFA
         rViCvLksweOcfiTfKycUwejROdeu6pJn1HtQqombGMQJuk4DsGewbWLsojHgT86gKW7M
         sKjZ2vOFWKSnC7/7IUx9vbjkUW6K6BnGADL4aU4zBy0g2FMbUh4+bsFygrg1RmpQSpkA
         ou2o5FF8ghwld9IQ9XHoFKRNa7siPpOZEOVlVWadbpxPgJqfYcTAWoNqtd3x/nzyurjt
         98voB5cFvCe+nf7+FQekKSXLtKgEXVKpB0JbBp4TWd7WMZZc1VEU3ZNaubXfX5d3Ont1
         IctQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FaTIz6BTDc1LftU358XwOP5pP9cSReSv2TxCaMtuWjDvGI0H2olg6E3IB0ac9I7bPRtE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAtxZCWaJOtYGo5xK68FFzGksM51LBR76cNvvjq1QlAW8zjDoJ
	2E5MGCS5M5pVD9n+u96fF5rzou0A5VdhtZm6zbVNiGchtK+X6vF56WC0v/zyyXCIg3RUL0jntDW
	17DFArq7mTnvAwchobXqoPEbNWTU+rt8vBPHym1mlzUTFCS1nYyPI3KYVQ5wp9TQ=
X-Gm-Gg: AeBDieuZNkX/2zcV8MWVn120LqgspQl0fwlHN4LG/GfbpzwMR84k8XXUUwyelVSlmkd
	3EeOscc1BXiAfwuJdrNVjgtW35qXJ1A1l1mDos2siYAbonNU6TLfFR/NBwPQC7X/McG1kWYcC/D
	7981hvF+EL3oK5CUZ0YAg92pL/n8OpurZ6X2cYzkK5LGL60X/QMygu8PDx0KbSbiLi0ACa3qldl
	ftmOm476l5sge4q3y2aLaiKxk/+TK/Mw4P1J0Yunmd49+bcH9hhb+9MrsoyKgbzrQDSW1GjIHAM
	9HAyzDQhPWMqOLSOLZtGPYij4OC5aJ0q1DTA/QE3W9cuzTTMmYmWeiI1jXyJ8DoiVMVIHazgD7K
	KZxq+hCF+Hk7fYjd8RMokcBO/oIITMlYaYrRd/gRgrXxQ0smPsEzwNRY=
X-Received: by 2002:a05:622a:1803:b0:50f:b3d0:c5ed with SMTP id d75a77b69052e-5100e19ac89mr120477461cf.31.1777488641169;
        Wed, 29 Apr 2026 11:50:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1803:b0:50f:b3d0:c5ed with SMTP id d75a77b69052e-5100e19ac89mr120477171cf.31.1777488640690;
        Wed, 29 Apr 2026 11:50:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:50:25 +0200
Subject: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4037;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IxeH2edhasWmVeNbNp/ezQYnOKLSvsnMrG5M06jPP4U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lL1xAeiTE41G07HB4Y0Vj98kN7s2Xr+KVQ2G
 9ZpNj1RtM+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS9QAKCRDBN2bmhouD
 13IrD/493xeu3QXek6mMJuCI1j2zfIkusN4OWqWkdcDI6OUN/qa6VEUYBu590F7XCl+8TUnsSGH
 jIpvB89NfyyC9XjzP1VTfZq7blgA4e+FF5nLFaMj8b5iTGVMNac9IHhhGxOSH5jDiJCSURDTXT2
 sPy91+O9+hlFZoHCHVO5P+WJZKcNyhSKaK+JU2MayojaAo6pVi5O+DTVjqOLq7ooP7fcbxNQGiO
 aeo3mEzai7UBk2mS47tGfPl/KrT3LXUhs6qtXDogB0DKAfOgXoahlmy7+PL8EsMegUtqcwpshEO
 LdbP3bG2YR84hxvu9sLQnGTVGmR9vY4WNNKP5yQsdvKFZd1bvT8XrGr+xaPqaorfMTBthc8pYqC
 jRxSUGEbSAF7DOZrTOmHthqLGNfIox94pOGWD6RITHtMpIlekxEH1fzhxgIps92jGbK34fX1qrM
 0KLr/EhqQpq2XLxEOAX7dKB7z9gt/fYECOgJgkMww0G2RTsk7xAc/mwoZTMh5k0s2JCExkDNrqj
 yVxQKfTLVoQ2oBUCOLRZRL0vzueUbovf2VosttSeSoUtee4+dBfoqp2OEUudr3lnnGu83IrqJ4V
 zkviniMWXx2ojzKV+ALnN7VM6JRPIh5OzdPiBQVoO5+y2Cpq5ylG1MCQww4NIrKE8l3JM3azJ16
 7bIBoVnBMYy781w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: RdQhMOTCqpYARzM1DH6A2oQjEzJRi9Kd
X-Proofpoint-ORIG-GUID: RdQhMOTCqpYARzM1DH6A2oQjEzJRi9Kd
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f25302 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s0ajyRo-FUR_dJIxqt8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4NyBTYWx0ZWRfX+aJNaWUGllnR
 si3Lt4rk1HOr7nQhIRYrmaYe81LIC+BoUHy8Irf7LVAjBprIaDQuj1pSyBIFss94lAa28sxdD79
 AIe6gYwyEqRyCAFmGu2pQiuXmENXs+zwGk74hrL/SOUhFOtFrdfuxyHrGihyAGSgkGvyfj6NCrX
 ACYC3ZcYhekMaKVeraTWFE+/FUtj/aEFxvnADZWkUN5HirHndVW/WosZykQuxtgvoA3D0n/NrZx
 pR+XFnWg+ZivNu2C6MrRXmTDswkrjVa+yWd0b6G6USnxAykxfRsia0ts0eTdDp6cUWQht+bAc1J
 AEEyjEzgjmA5ZbPg6quzbJW+o5Us5NOR/HhAPVooRynM7cGijLAWH59iyCF4bZ0Yf/H6q4DzhWd
 yyFZCptNSB5VqSSoHJUedHqcwTs69OnStcySLQITZ5r8Z9V/XWYw/M68DNC3JI2FpWnwEIoroYS
 zB4EurVUM7UpqollZWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290187

Make going through `make menuconfig` easier by disabling the unused
Ethernet vendor menu options, where no actual driver for given vendor is
selected.

Impact checked with comparing old and new autoconf.h:
  diff ... | grep '^-' | grep -v CONFIG_NET_VENDOR

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9f6d5d6ef69..79f6294fffdf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -349,15 +349,33 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MHI_NET=m
 CONFIG_NET_DSA_BCM_SF2=m
 CONFIG_NET_DSA_MSCC_FELIX=m
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ACTIONS is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_ALLWINNER is not set
 CONFIG_ENA_ETHERNET=m
 CONFIG_AMD_XGBE=y
 CONFIG_NET_XGENE=y
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ASIX is not set
 CONFIG_ATL1C=m
 CONFIG_BCMGENET=m
 CONFIG_BNX2X=m
 CONFIG_SYSTEMPORT=m
 CONFIG_MACB=y
 CONFIG_THUNDER_NIC_PF=y
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_DAVICOM is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_ENGLEDER is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
 CONFIG_FEC=y
 CONFIG_FSL_FMAN=y
 CONFIG_FSL_DPAA_ETH=y
@@ -367,16 +385,21 @@ CONFIG_NXP_ENETC4=m
 CONFIG_FSL_ENETC_VF=y
 CONFIG_FSL_ENETC_QOS=y
 CONFIG_NXP_NETC_BLK_CTRL=m
+# CONFIG_NET_VENDOR_FUNGIBLE is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
 CONFIG_HNS3=y
 CONFIG_HNS3_HCLGE=y
 CONFIG_HNS3_ENET=y
+# CONFIG_NET_VENDOR_HUAWEI is not set
 CONFIG_E1000=y
 CONFIG_E1000E=y
 CONFIG_IGB=y
 CONFIG_IGBVF=y
+# CONFIG_NET_VENDOR_ADI is not set
+# CONFIG_NET_VENDOR_LITEX is not set
 CONFIG_MVNETA=y
 CONFIG_MVPP2=y
 CONFIG_SKY2=y
@@ -385,13 +408,34 @@ CONFIG_NET_MEDIATEK_STAR_EMAC=m
 CONFIG_MLX4_EN=m
 CONFIG_MLX5_CORE=m
 CONFIG_MLX5_CORE_EN=y
+# CONFIG_NET_VENDOR_META is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_MUCSE is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
 CONFIG_QCOM_EMAC=m
 CONFIG_RMNET=m
+# CONFIG_NET_VENDOR_RDC is not set
 CONFIG_R8169=m
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
 CONFIG_RTSN=y
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
@@ -399,8 +443,15 @@ CONFIG_SNI_NETSEC=y
 CONFIG_STMMAC_ETH=m
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
 CONFIG_TI_ICSSG_PRUETH=m
+# CONFIG_NET_VENDOR_VERTEXCOM is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WANGXUN is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
 CONFIG_XILINX_AXI_EMAC=m
 CONFIG_QCOM_IPA=m
 CONFIG_MESON_GXL_PHY=m

-- 
2.51.0

