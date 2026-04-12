Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFC8306B1B
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013977; cv=none; b=AcZDUhjd2V8qkjIcxhfC4AhDXijHVgM+8ku3+P82WFEyNjO4aZk1UmB+wNXMUGjjmckiQ53vnCUCMHkAWk2YgAcQebMkM2RZjDblQjwR4g7g3lcH5M/KKJUkV9LoKx76c2Kc7/JE+N2gwkOgMW/hUk99J25p3j3Szadswd6Hqqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013977; c=relaxed/simple;
	bh=YV3YfCEMXg/5PND6vVExXVVeEAoJHpkm1JRVpD4pXyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbBc5F49N/H3/yF6iHHwC4KKWDvOI41f9CN4P53VDpag6nx3NymZvPIJ6Vy2ikF+dBWtU9NQfnKymvreGrZvBndf6gSedSydylHO9RjNuBkfRJ7EopMm3489AKNPox/RYtysa3YFX2OP9SUP+K5q01rTMixz689q4JMXJu2sdfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaX2YV+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DklxHXx0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaX2YV+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DklxHXx0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5swV533583
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmWYTgynkvgBD+uM77KEXQPDTogdgg03IqQ5cV8AE9w=; b=CaX2YV+AWf7cr90j
	n4IjQpL7i0qqwrwGGBIVM7OZ3hdSocvRmXicGajkRqv/VtKDexIv03dqY8yHeZLe
	zYmncyV0kLQ04NCACfhaRzaHSxv57Zq/9lPMcsL1fr4zHPK1e9z9Z4o1k1uw2cu/
	oy2Tybq7RgYOeUHop3rDyrVZl4DdWOe6c56788C8ZDrBzKSIdbQ7tQu4wAsO+vQI
	FxIgSoLa1uTkvO165Anq83W+k3ON+GC8H/fctWFmtUqGJJgJSnYdJCXJAKn1whn9
	+13HVGPlLodS1pyn6/79/bf1pBQxvwJJFi9bx0J0Rl957EArM6nsW9hhArqyFi7L
	maYzFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2baq8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so141886961cf.0
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013974; x=1776618774; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmWYTgynkvgBD+uM77KEXQPDTogdgg03IqQ5cV8AE9w=;
        b=DklxHXx0irQpTczh8itDBIOILvKTMnoU0G5JHdEZbzdd+4+x3Wo1zQgVxkCxNWM8yP
         TKFlpzoYREo3HwfosqeLjYoPFIDoWN0Xb5oDulAce6eJIohmuOArJXvlHbAWKF+K7L7H
         +hdPylWRP7EioJMARbIGITFNSQnngQ90McZ5xwpkilfqM6lYEoKinb9co1dv7OTT6z5V
         0Lu4SBKUdu2GWl0qEas6dpu88Lja9NSLcx86hq9Ilru3K7RT2bGsZDoxzHKJrynYslDf
         hPt1vpv3KR/RBHAV9qPvs0Hzf7/rIWBIBcARNFWmV1sbqBuvIUUtpk4X074umtrqwPDe
         r8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013974; x=1776618774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pmWYTgynkvgBD+uM77KEXQPDTogdgg03IqQ5cV8AE9w=;
        b=d0gc0iLswcMKtIjaeEZRIECeGDbQcT4u5hg6rLwivTdrH+qJUwsP97zv47ZCMQ+H41
         5TdWg42IfkOcpe2SbrzW/wOzFtndhrF9ysIIq9hkBsqjaqS6Yt/ZJpJH34F12pbyD656
         ETXzGJBbyhi1lsEmy5donAK2ZV0jUCSjnwp+E9m788YZff9EOD/Ea1yY0kDjTBZdqExf
         SPlTz+hdxNrXm1R1w8LLDkDULXswWiEmeN/dZQZnpyUBdoa5te0vsuxUoPrFJOKGkgIb
         nkCCbI2DObxOgiZAwvtZuaMJF4C2xQen5bvvINak1X6R4QJTpsyLggSkz4/eYxNcDJ8S
         p0ag==
X-Forwarded-Encrypted: i=1; AJvYcCVH/903FiPD/22wR5rKBFoEXHXNnsHX9ATZhpu/Bnw8WHV5qWopoUjzudN+Z52mqtyKJSA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Qid8HgDRS+wmGHaVzgQNVBJnV2iz7daqOKZ9fsm8apn4BQSq
	XXsB6FBZm5FRBvAmyDVLfSgfmMj3VK2W0PBbkbv8dlUbgfT/N3Xum8QHHgWSDaY5d3aCe4WJEpT
	SJagWNyQFw7jrjO0V2WrcCUxSebDIsStz955q+jOARiM73cpcAIZSeLk=
X-Gm-Gg: AeBDiesQmeG6qWDo+gN/piYcA1MM6WSiyMYry+WoGRiJMLr76WMxYUzC0WksOcAt79u
	9rIRvay6wZSzcsV+PUhrQlAqDy/YKB9wjnvr/wLYFywAgrgDoy/D7MmPUoFekWe4GRCWBHgwAZh
	vtcUZWnSD6gvAPda6NqmWm0W5KNROwXqRQkVcldN/V51xrsfgWyQ4HWq7sV+XKN+65n7G5SIyJC
	WtZjyTQBCoYyWAghk2wesvW6tfUM79EXHBH6t3dS6dOSN5MYrJwneNd5blZR+0DPH8KbZgw0Edi
	Hq5xznkUQFAicDEp3QWaz5nWUYVbPBXAQEi8/NHeYdQXFnWXixC6QiF/9+dtE8t4sekLCKVqFw5
	iCJF9ll/gg1WGeekYSZZn4aC8prQtaOo+CxuhipWpBBsF
X-Received: by 2002:a05:622a:250a:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50dd5a44875mr159814041cf.0.1776013974392;
        Sun, 12 Apr 2026 10:12:54 -0700 (PDT)
X-Received: by 2002:a05:622a:250a:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50dd5a44875mr159813671cf.0.1776013973997;
        Sun, 12 Apr 2026 10:12:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:44 +0200
Subject: [PATCH 1/5] ARM: multi_v7_defconfig: Move entries to match
 savedefconfig
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-1-e76de035c2df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YV3YfCEMXg/5PND6vVExXVVeEAoJHpkm1JRVpD4pXyk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KOqLrYx0npCq6gwpwF2lTOgGsbgP/31ghaw
 E6eVAzbGdiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSjgAKCRDBN2bmhouD
 11DyEACUql4jcZA1f03hJCGBKd2/QaO8Lsp3pfN0Y9n4Fa4+YOlrZQPo/ocbQgIyeAskROqqwDT
 kN9NftU8St6U7BjNmdI9inAGSj1tFf2bbExZFmgjFK87XqLMN/RpQb7NELew0dbjBpjGSVP82Ja
 uzdH6vgMSzStwHQUEa3tN48ZFZHEIufBHxe556qFjKOwKtlXvdnJTMxcrX+rir2XPGbT1dVKxEa
 bHzwd37EiT7VymCR99Fj83EMYwnXZei3pRe0DRr4Kr+rRRBSqNXcc+7aBIxlOIr2CuI4zXxraYp
 Gca+OD8qRWwX4Qd+5i2JW88q+URmLaCh8ragxeu9puMztl7+XTeD5hNGLczpANRDdmpPgl7qnN9
 buv3j1Y0TJaaSD6nn82Ep7AN3okLHFZYz53uUK9QL20PyARVSJWSCCSW4TlW+DSDgrglcm7G7hv
 BtP9z17m67fZxL6SnFfyn2prLOfwWvsCHaVzJQlk2q73yvVBOPVY7YZCcSUKY7LcjRqx4192RfN
 JIhIxCx8T77oZI7naeoZXYIa8OxuLWTuJ/pK17DpEx0Kh5+Nfp1fEBlCqQl/emVXQHYjVah/jlj
 NXzSZCSyzxaWM8VPE1KWbM5DT2LvkDk4gVzORl/U1ZhKoHMT6f8ceqGm06/FOVqoOCkack+2yOD
 guMcBteMNhFCTVg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX0O4VOva2boh4
 KoDQR/QqEDTk8Gq6Yu9t7SbxOqCAk3VVpdP13Qmt3ENlm6L1akBwVx0bcdK8/W1d6dKlQArwPNm
 idQpZoQXwtyyVenOWISn0V1sYwQeef61kT9C1kMPGAjLSw+iKLRJaThT1zl1O5vX6ebb0u+1QI+
 VJinMiY4YdTXbSAhW+gBfMCisgA1TAztZ4XE/IPKcgDfThKLxCMExgevY3QBWdLoYVh8U/Guhs8
 0ILvzV8kmPfVhvyAuv5XgdUQF/XnxYdo3gL4geHMo5k/RIqhylRtlayvmtIqGlAthEB4tXxtUy0
 TYfkXuvg/Ia2pQX7s29xGS3fobu16noh6K2AiDrDyI2YOiLLAGOXHjBSbLGQ0RLaUBwWqUEgOTQ
 /DnbswevxNlcWlAh5nOLfao03qqcD7mNgbvg7e70tw7T6gFZ5I9OE5sircl5i2OFVvIoA64STfM
 uHAUWy/jC/YuKTUiCXA==
X-Proofpoint-GUID: jPpqakNj0CGsL6HlraxCwy80JHszkTi-
X-Proofpoint-ORIG-GUID: jPpqakNj0CGsL6HlraxCwy80JHszkTi-
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dbd297 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2ShsH9uPjTmnt004chwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120167

Only re-shuffle entries to match savedefconfig, without removing any
symbols.  This helps in reviewing defconfig when comparing with
savedefconfig and looking for obsolete symbols.  No impact on
include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 82 ++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..c477454a4694 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -360,9 +360,9 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=5
 CONFIG_SERIAL_8250_RUNTIME_UARTS=5
 CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_ASPEED_VUART=m
-CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_BCM2835AUX=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_EM=y
@@ -731,40 +731,8 @@ CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=m
 CONFIG_IMX_IPUV3_CORE=m
 CONFIG_DRM=y
-CONFIG_DRM_NOUVEAU=m
-# CONFIG_DRM_NOUVEAU_CH7006 is not set
-# CONFIG_DRM_NOUVEAU_SIL164 is not set
-CONFIG_DRM_EXYNOS=m
-CONFIG_DRM_EXYNOS_FIMD=y
-CONFIG_DRM_EXYNOS_MIXER=y
-CONFIG_DRM_EXYNOS_DPI=y
-CONFIG_DRM_EXYNOS_DSI=y
-CONFIG_DRM_EXYNOS_HDMI=y
-CONFIG_DRM_ROCKCHIP=m
-CONFIG_ROCKCHIP_ANALOGIX_DP=y
-CONFIG_ROCKCHIP_DW_HDMI=y
-CONFIG_ROCKCHIP_DW_MIPI_DSI=y
-CONFIG_ROCKCHIP_INNO_HDMI=y
+CONFIG_DRM_ASPEED_GFX=m
 CONFIG_DRM_ATMEL_HLCDC=m
-CONFIG_DRM_RCAR_DU=m
-CONFIG_DRM_SUN4I=m
-CONFIG_DRM_OMAP=m
-CONFIG_OMAP5_DSS_HDMI=y
-CONFIG_DRM_TILCDC=m
-CONFIG_DRM_MSM=m
-CONFIG_DRM_FSL_DCU=m
-CONFIG_DRM_TEGRA=y
-CONFIG_DRM_STM=m
-CONFIG_DRM_STM_DSI=m
-CONFIG_DRM_PANEL_LVDS=m
-CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
-CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
-CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
-CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
-CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
-CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
-CONFIG_DRM_PANEL_EDP=y
-CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT66121=m
@@ -780,20 +748,52 @@ CONFIG_DRM_TI_TFP410=m
 CONFIG_DRM_TI_TPD12S015=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
-CONFIG_DRM_STI=m
+CONFIG_DRM_ETNAVIV=m
+CONFIG_DRM_EXYNOS=m
+CONFIG_DRM_EXYNOS_FIMD=y
+CONFIG_DRM_EXYNOS_MIXER=y
+CONFIG_DRM_EXYNOS_DPI=y
+CONFIG_DRM_EXYNOS_DSI=y
+CONFIG_DRM_EXYNOS_HDMI=y
+CONFIG_DRM_FSL_DCU=m
 CONFIG_DRM_IMX=m
 CONFIG_DRM_IMX_PARALLEL_DISPLAY=m
 CONFIG_DRM_IMX_TVE=m
 CONFIG_DRM_IMX_LDB=m
 CONFIG_DRM_IMX_HDMI=m
+CONFIG_DRM_LIMA=m
+CONFIG_DRM_MSM=m
+CONFIG_DRM_MXSFB=m
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_DRM_NOUVEAU_CH7006 is not set
+# CONFIG_DRM_NOUVEAU_SIL164 is not set
+CONFIG_DRM_OMAP=m
+CONFIG_OMAP5_DSS_HDMI=y
+CONFIG_DRM_PANEL_LVDS=m
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
+CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
+CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
+CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
+CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
+CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
+CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANFROST=m
+CONFIG_DRM_PL111=m
+CONFIG_DRM_RCAR_DU=m
+CONFIG_DRM_ROCKCHIP=m
+CONFIG_ROCKCHIP_ANALOGIX_DP=y
+CONFIG_ROCKCHIP_DW_HDMI=y
+CONFIG_ROCKCHIP_DW_MIPI_DSI=y
+CONFIG_ROCKCHIP_INNO_HDMI=y
+CONFIG_DRM_STI=m
+CONFIG_DRM_STM=m
+CONFIG_DRM_STM_DSI=m
+CONFIG_DRM_SUN4I=m
+CONFIG_DRM_TEGRA=y
+CONFIG_DRM_TILCDC=m
 CONFIG_DRM_V3D=m
 CONFIG_DRM_VC4=m
-CONFIG_DRM_ETNAVIV=m
-CONFIG_DRM_MXSFB=m
-CONFIG_DRM_PL111=m
-CONFIG_DRM_LIMA=m
-CONFIG_DRM_PANFROST=m
-CONFIG_DRM_ASPEED_GFX=m
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_WM8505=y

-- 
2.51.0

