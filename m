Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CA04028EA
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471662; cv=none; b=ADfPPIzf7tYPX1K3viw0wwjL8VbuEDYsVTWqb9IBNKpRzojq6nYU6B9s8zkZw1KOzXHzsbRT+w+PwEm5SqekZUYltdYParSsMAn3jH3Ku7qNgk2lWMzrmDXbKdwtd7gGoa5hzrxY/gjMpwXqUovnD+Xa9CAsVQem2KT5WkSpAAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471662; c=relaxed/simple;
	bh=rAbXFaXFU6UvePteZWVBleQLgNYQKxjPkG8bfnnqoDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZoSUJ3wFcAyJQKOJXLh25oKNeHTutvqnkkhJzFmSw7SMlvnroodtBJYF3dF2RZuJuuvdkIghD00CiuTTUT8BwXcTDLVqLiHIZOdFBbfBE20Admoc59EMoDGmtULyK6SYwIBhX3NjSZ/RFF6S4icgTgvM2Ve2zhfiv4PzGmtjV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRoN8/vI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP6ySwkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRoN8/vI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP6ySwkX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RHER1200005
	for <soc@lists.linux.dev>; Wed, 3 Jun 2026 07:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FYOzg1Fk7Sgk+JACbw9qdH4YfBZnKqaT7rz
	qbcYZULE=; b=oRoN8/vI5m8H2bkLd7NMzQpQhy2/wmJ/idkPGfPOZViN3A34FCr
	n8rNMPjVIt3uMgsPzOeS+wxUqBYRfTvQTG/cow1aQGxZhakTMhTcVoDgP0UVOkSy
	fo03dCnvcWcdskX/y4kiJCqzbcEI3a6zn138QDUctMsh2pI7Xxnm5qjf7oBINApJ
	GSnjxNPXRlFKJPF98xatbAsnvyQceOndslFa8NOoPUScVL6gj61GDD2dvPCQ6b6q
	al+5foNI4DEgZLQSmfpdIbyL5shA1zqE4J5CfHEO7Khs1i2CVbPuxeOm9EuaR5bY
	4IDITVCSYzEfulicf/1kewr1V8KIoHy1ysg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw0s4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Wed, 03 Jun 2026 07:27:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175bf22b1bso5336961cf.3
        for <soc@lists.linux.dev>; Wed, 03 Jun 2026 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780471659; x=1781076459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYOzg1Fk7Sgk+JACbw9qdH4YfBZnKqaT7rzqbcYZULE=;
        b=OP6ySwkXm8Xix63FihjMfEShBKdP/HoUVv+XPHgGBAbx7DzoBtT1/l74MVQbc3VXRR
         mc+fDceeRv4qWNYxZXMsWkEBVZnD9+/GNyVvMViWtCL25nHmCKpnZ6HcOvFe6/gBUvDO
         HvJMXOglkrT557iZxNErh+MvGCH4jwk3jcqIY8KMed0fsM2m/VIkEQk9npF4NnZynOcJ
         d6giH0Lceaqm7mm7mUGEMC9w+aAtkheKxI5zWoLPQIwTWY40bys1B1Ig9aUrHhsu5Mzu
         jCpLvfSgHvHLXMQ1HKWstOqyvXg/UKcKoqjW8mx1103jzTzI0zZ5qHqDKtAQnQaJISLY
         x3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780471659; x=1781076459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYOzg1Fk7Sgk+JACbw9qdH4YfBZnKqaT7rzqbcYZULE=;
        b=qEBYIcTPecfcw9glyzujAvMuotzdYB3URlfGgXbG77e26fUg4SS4TEqPJ3Vme+/GRU
         7Cg8BPISrp35hSJ83EHiY7xpjBZ4Rqsn+k4G+/n2xDTZPOB414J9pc9Tnm6zuzX0IjSd
         y+puCIZUbRWjDeIcftlb/g7Iw5l6198HaQjmiL3cR/oST4Ny0qSJmFLtUHNz/WwmbP88
         L2eGEPBSFK0nd1BDL+qAsspUK+NLl6jhrUQ/gcTtxwhaVUpK4O1nCcAxDY0+dMLUftWK
         FgyKB5qdWVeFgBbe1RkbBz7aAdvibARE3xi5bQE/svo2zOBFk9biXfWEFRmuX+tzn+Uk
         kBMA==
X-Forwarded-Encrypted: i=1; AFNElJ+P2RwVgaY+JlyDL7AburBWKuQvparsFi0cDu7e+6H02oMxVOsxZrHIHrnI6jeZjbkGXpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuGYzz5lxM6ZsDAU970wXZcYzeU4/AjfH0OpmlsfZH0zZx+mtb
	uPvWrXK2QpR1YaWl1HoK9GlP5HLT2ukG/hM32wi9XFGbVd7Eugm3jG6/6+hGkTu78TGlgYWbsQp
	22rcEn7mLghcKEGG+M9BmdWLYEj/2N095c0cRh79mgcMeRSBxPszdc64=
X-Gm-Gg: Acq92OEFJf7s7DM/P9MzIJWpnzrshnT/T9jz1RFb4CtYma1Eghat4TqherpkH/VvcKp
	rIFNfyf9ZUhjUH8PYpaJOoG2GKJNC0S8PZqF2b98JqPPCts1ZUm4aU3EUUEfVF6TMmFbBioxiCS
	WX06m/xDuQeD56xRdIOf/EGUeNCCYHClgP+bO4LTfxPA4qzPQrwxsHWjmVinB217Yx6Yj/oYU5q
	BLQrsFS5X9OZE9R9M/3o39237KTD2yEuG5hA/JY1jy0pahh0efioOyYNWoJNvi/GvqSlruaujnS
	2MjH6P9SWicZdeVuICx6wUcz7mpq+gJv3LbPlmHgSx5TP5+LSOuO2qw1TSpcb0jrS2bdVgJ3sk4
	N712Ykv8tv9xDYuiBFCI225NvicB6oJi7dg07CU+5bo+BxBr1KLdOt8+5Yeb3+UreSJ9glWuL+0
	zG5j0u2sF+H1xfHAu7
X-Received: by 2002:a05:622a:50c:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-517785ae63cmr36451611cf.1.1780471659125;
        Wed, 03 Jun 2026 00:27:39 -0700 (PDT)
X-Received: by 2002:a05:622a:50c:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-517785ae63cmr36451391cf.1.1780471658627;
        Wed, 03 Jun 2026 00:27:38 -0700 (PDT)
Received: from quoll.toolboxoffice.it (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm5381844f8f.0.2026.06.03.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:27:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
        Russell King <linux@armlinux.org.uk>, "Theodore Ts'o" <tytso@mit.edu>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: configs: Drop duplicated CONFIG_EXT4_FS
Date: Wed,  3 Jun 2026 09:27:27 +0200
Message-ID: <20260603072726.19404-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rAbXFaXFU6UvePteZWVBleQLgNYQKxjPkG8bfnnqoDs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqH9deBeWI1AbqghJFz4j+0xmG3QYTxBltIGzts
 QbZR0wzmGKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCah/XXgAKCRDBN2bmhouD
 1wrHD/4xVkFvRp8eDM9rgBwX69LF/qnkkZaz849Bfft3iWPeAO7Z14ivBJiBFpOXhEHaeA81JMl
 pXGS1M2c6eAp6Ezq21bhFZyzqwiFdAfiMsFrQoEjxRDu6q2hdb+dUfUrYTnQk313PhNlnMdHBzC
 Ryv6/H/c/4a4m6cA/+ewcLo0gMKxarDfu91WTFOQZp0SvcJ6+MxWOrDc8laipUCddKjnJL8VAC9
 PgB3U53SeIiIdbFHVLDeJI1JmwyrDgJDmcL5DZPtT1MgVVyUV4lLvgeWqey2U2QgHIAsCsJ5U/L
 SyrDLhYcTfLpDwqfHIzVN9lQw/VlniyDUmN5WPxAMzk81mlaNvgw7mFW7IjU4KtocC9WsPrAw0b
 clSxFqqJHR6hHpaI0mu76nH43iOTm9QRFdxkekg0FjfCQA9/O8PcNzq9uv6wL8DQwORJhfIiMng
 rEKReJWQJ2OMy0JV625kGpyy8WabZQZL8zAJjvCpDoc81+6EiJUwPhvcFbdlOg1mty84kNCslM0
 /Fs+a7/ah23DVCiWtKbQwctAwX1aQmLlHK3eJxEkaYYdkzVO2kUopC2FuwfffA3AfC7t/U97Zms
 TJ4nHlFzpCqlPXPk6pnG66le9Ye7jG2msJmPgqqr+EJ2eS9g+fi14NZYerAtCJpLPAWy3N9jfIL VKi+9Cxx2vVK18Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EDwrxz9fCpv2nBaMj_8R_b8k-xU-HIIL
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1fd76b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=s6cvWP-jlV_YwPVwP18A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA3MCBTYWx0ZWRfX/YEDtX7v09VP
 BVL3USy5cuWvAKxQJJPKyWjJjXqcQyuZ8SoReGiwjwFBfbSjBGlKCOBeqeOTSps+gomJFnnBo6m
 MZHK+xgyvHhI5ivYMrztRFlOx/4BrU+iKwPBojQyAPbGhTEGeMIXPqOY6Ccqdn4fzDjswyMFbyi
 pUEABoleTcs9WY3bq/QjTLNUpB6k6LyjGQ2mjCHm18cIBgnrrL7zf2Iv6YNqgNiERNv4OZTZYvA
 6QWF9+Cg5w/GyqWBWdnBfITo+5y62uHeJ33BCaksH6/RxRj/pMH2Ar40mG25cc3mPS9da1l3IVW
 vg2sgK0uz/sTDMm2yWjDbaoKFv0newhHX2kf1RDh12dfGQISUZk0bd3coQV8n0LY0D+jsjv9TRL
 r0cCIH4srO1dtsEDsTldI8axukNQcBEeVMg22ODkefxDzlcgPGunA7kiRN/MBwGgDlOZHj5XUbJ
 7ON/KfD+Tgu3kb/irJQ==
X-Proofpoint-GUID: EDwrxz9fCpv2nBaMj_8R_b8k-xU-HIIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030070

Remove redundant, duplicated CONFIG_EXT4_FS to fix warnings like:

  axm55xx_defconfig:198:warning: override: reassigning to symbol EXT4_FS

Fixes: c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the defconfigs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/axm55xx_defconfig | 1 -
 arch/arm/configs/dove_defconfig    | 1 -
 arch/arm/configs/ep93xx_defconfig  | 1 -
 arch/arm/configs/mmp2_defconfig    | 1 -
 arch/arm/configs/mv78xx0_defconfig | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 22b189090e15..0952e5e94c5e 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -195,7 +195,6 @@ CONFIG_PL320_MBOX=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_CUSE=y
diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index e98c35df675e..3d978ce34b54 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -97,7 +97,6 @@ CONFIG_MV_XOR=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
 # CONFIG_EXT4_FS_XATTR is not set
-CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_UDF_FS=m
diff --git a/arch/arm/configs/ep93xx_defconfig b/arch/arm/configs/ep93xx_defconfig
index 9f3c7324d1cf..ce41dc8c435c 100644
--- a/arch/arm/configs/ep93xx_defconfig
+++ b/arch/arm/configs/ep93xx_defconfig
@@ -105,7 +105,6 @@ CONFIG_EP93XX_DMA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
 # CONFIG_EXT4_FS_XATTR is not set
-CONFIG_EXT4_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
index a9a212abfd69..0ea608c75f22 100644
--- a/arch/arm/configs/mmp2_defconfig
+++ b/arch/arm/configs/mmp2_defconfig
@@ -54,7 +54,6 @@ CONFIG_RTC_DRV_MAX8925=y
 # CONFIG_RESET_CONTROLLER is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_MSDOS_FS=y
 CONFIG_FAT_DEFAULT_CODEPAGE=437
diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
index d3a26efe766c..c6b46141cb69 100644
--- a/arch/arm/configs/mv78xx0_defconfig
+++ b/arch/arm/configs/mv78xx0_defconfig
@@ -93,7 +93,6 @@ CONFIG_RTC_DRV_M41T80=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
 # CONFIG_EXT4_FS_XATTR is not set
-CONFIG_EXT4_FS=m
 CONFIG_ISO9660_FS=m
 CONFIG_JOLIET=y
 CONFIG_UDF_FS=m
-- 
2.53.0

