Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA6A2BE7CD
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013881; cv=none; b=h4UQrIqDPOrMcxOWGIdFh875VEo2TDzSFh//l4bqrUbWfDz9Up21QlzsLLvvTWGhSDUww9jP5P+33xg/9Ym0GQnMfpuxAmS5UNTPK+CX9htS9KqLuYPzsQrJXZJnYdnUQ/FfGkJ2WTf+ok2zhhyLMeQgpccHXJ2q36GVate49CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013881; c=relaxed/simple;
	bh=GCFa3rZK7tBA5rCTztLSE9V5e10yzCOD1R6YPR4Q31A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dwL2qKzZ0TKH+zQn9ro0C2Y0YTNmZlkeyWCkpixBef5ABMC4NRbLwRHQ5ZC/okLu8yTzgXcG5AjuocRu0XlACfDXKQEivkh7gqElPby7OhEsmod8ZUyNUe3n+A/l3NEfWJTINbqAyXQUvcHPmC+N38FCioTvVsumhUq7LS2BDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2fSz7hJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtcOhqHR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2fSz7hJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtcOhqHR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4f041120267
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Od9vc3Rv7PAed6QWv5NG+lGhYH71uQtRbwq
	H/yjZO04=; b=V2fSz7hJwXrcs1fWy49YdZVpGblGsEDclDtv9NMXj7IKnTq3vgf
	DwdvPcur0iouZvqeQQVUOGZzhnTCuAIGhi6OnxuUMeDwdWTUa2EyWr2YxMR020xv
	e6Aa4bZyOh0ZuIEFAU2Jpw9y6EMdVIqgLTXY5C5iaVpuMPSkhfuX6wxFHx5HcX13
	hNoGJWu2tzOhZbyJRxpQXJ12+WBaZm+DBDxCMBYptVzquPDwvZnrhO3DD6sQdFsW
	A6s9wMYG6lCU0pzCxGgw+67JSBY7h/jeDclLbtDsAIUA8SCmVr1Q4vdVKHeKph5p
	9z3xvbGdr29lm0E+KqIzRfNCZAbSyWYq1Cw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jtnyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:11:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da31af14cso45401851cf.1
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 10:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013878; x=1776618678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Od9vc3Rv7PAed6QWv5NG+lGhYH71uQtRbwqH/yjZO04=;
        b=gtcOhqHRAkHmR9ZaXWy/MF+Ijhxxr70ZiVN44TJBQhJL6fMdzPsw8xs2ZoY0JQbtP1
         mp4BNbjB1fGZjO7f9O8JKNM27gdpI5wDzMBbjvAbbFJA3UnoOEqnZgQwgUnRoh5gUzBV
         Pz4v9qX/cgXRUtlv/qj3AeSvjBL/Cwe2SMZSi5VFD2XfVwhV+acC/jwTSQ+tWOSS+WcF
         XJfBCus3Bx1JwTDEIV8ZhBIYsEIH+AeDY3Z6f/HDsIVSwOVwXJzpqprWVSxkUBieEIZ+
         SgdmBKuC6yosdGLVhyMyMvG06TOFSy35Ld9U3tyL9le0vghVx6s9l2+qdSkUXVOj9Cnf
         1b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013878; x=1776618678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od9vc3Rv7PAed6QWv5NG+lGhYH71uQtRbwqH/yjZO04=;
        b=rvssKpbFxfDg/2/1Xs8hp/RBdLG+ebINA53afeGOUDG60nlk+r1v7TUBVmrpMZeBrl
         M1+zlafU0W/gdTD35LgFdfGjMzhmTtYP4sm3KXiZ54NX9UxXtTpj/bSd9FybxipToFzY
         SEWCJSsb6zAo3LVd48Cx8qy8+6FatrdUmYbEl4BLlXW+AaxJ5SBQ04mQO+eX2R8+UWCp
         MUbVGCIxep2Ops/rvhp0rFqw6Mmgo74m9l5j2YQkdL8wWoQQyvk/fBn3Ufr2tRcHYb+u
         Q5+CBG4AvV/DHXRNOWKHZ/gxN36fvukahIv+lW/fpRt/kD8/S0EanpEdWbjIJCoBLORt
         2v9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXM5xuKxWJjH6iFJtpHvlS0HumBAvhUEbjD9AyAGA5MHWKlxVVHmbaIhV+RfcOgAz8/HeA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWnHyKRpJ6da63KbUIwa7n2ChxoNk0Tiko+EHTYJx/e/6LWp3N
	YEEZvyk/xFEbnu6t7Y1W+ZK3rxUuUQMSRXg6vfc8PR6MsHjm+OsA9XM7JSEQtJ4f9xk7K4VU88j
	Qc6MXdGqPMyB4rZouEloXoglRt2o32wL61VQbqkpy1pyrx4cT4RZJvhGaRR3sc4I=
X-Gm-Gg: AeBDietfMhDIFt25OPhtfVgVh6SYqBwFodRXB9jp12V47SNXIYE0sfdk+B55O+gS4hW
	/BfDJHdUEnkWiFX9slYM+CLSli96I5nNCn7pdOqy2ZA1HwKxupCql9tuckqd6tvlEGDTExJYLD+
	Xk4gs+qhsyA1ChFhrBFvD55cmrP/VneENQAeGWIN9fLr+JLK60qQ3VpcFZec5Z7Pfskhe2biM/W
	8cBApBUhj/YCvmbwe5IGwe9rHCs0CoaVR0H/M/ghFOFqIF3GUWWTLig8i+w/dvF37JJea3TBj31
	i0cXfVpl6lYqfQwgfw7Dyo6r0YOi3IlAoiZaIRHOwWVhiahmSBlDlosZN0bUFcpAvRvMzAVeOs8
	v7OnB90WxY7liaqxQ4HJrzTFqFYkbpiDu6KYJ
X-Received: by 2002:a05:622a:49:b0:509:3957:48bb with SMTP id d75a77b69052e-50dd5c43e01mr166831071cf.56.1776013878337;
        Sun, 12 Apr 2026 10:11:18 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:509:3957:48bb with SMTP id d75a77b69052e-50dd5c43e01mr166830701cf.56.1776013877834;
        Sun, 12 Apr 2026 10:11:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d592d606sm229006525e9.9.2026.04.12.10.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:11:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARC: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
Date: Sun, 12 Apr 2026 19:11:11 +0200
Message-ID: <20260412171110.630639-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=GCFa3rZK7tBA5rCTztLSE9V5e10yzCOD1R6YPR4Q31A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29IueTtlCN+tcDyM2XFL0DY70+Mibi9OBtifT
 FGbZ7lhlbCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSLgAKCRDBN2bmhouD
 17+FD/wJT2bmJKZuysgayJwMnfhPaG3x5k3l8UnuljK0+hlA4b05fcnGjnXGRNgoKCg6oSZZ91J
 SOMNR5ZBJjaG9x5ajXKYwGR8iRNow5Aob3cNaL/5wEXL1ba5ZPRWsvLQ/XCEj9rLit8dWixo13G
 KGaaLJyRlsGSdT3ALvU8Ux/lPxRMMVF4QjUk0OHBU6QsAE8x54TZ1U5KZN0CJLfcCL0LRhFYdF9
 WWMzM2p2/PvvJs4HM/B+79o8Fbtv3+nVnhKhLk0WOMeeaGmSIOCqeinvP2pYgki9NKJNBWalRQs
 lM0byg28PAiWa7nx84mMY5FkPvq8hydNFeoNxEtDiQAYljNOCoHlG2SzTjnVnxT2Zw9T+OiKk03
 BMjx8AjbcctmbjyMzcr9CeQZ+LgUPrZWr2F1GJPPkAG5qBgwmiWd1hxryRTIHRKpk7jkK835uv5
 HWgosWkXtCRwdVxiWg0yRpdeW0hTeDDb0orVGkbMnV9vPw4nGsd1zRdmb0rUkSTtHTAtFR6mR7K
 Ck372HWMfkkJpQXGi1l79C43n9JxDxjmxLSpuV4LjK1pZ8+z6qvFsjkPxiVcPZzQz7g71ui09HL
 dH2gNd9KwuVjYTuxlaLOFib3nsuyLTuHA2AP/zI1W1fmYr+ofWCWlpufd7+W9WtRgC81lZjiAAX hf5hZlnRv1JiicQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfXyN9OOl9mPNpL
 1aMlwf46oAz4XsUDANPonRTqBVJkeZS2IHjuiDnCt+TWxROPRhhtraAfi4dYYlq5VFgUb9mQOnc
 vyquBprRsmt8TS9ktK2HkDk5qo0ll+zKNWu+s7DGJfHlxAMVZ9Lq1d9tJQ+t/vhqjPYJb2D6N8w
 sikUKq702g9woQ+7cv1FFNANRf1RaUGwVg2/t2A6WhimclBPHFEyf2dY5gzbDClEG+5aSrjueUy
 NcqXk4JkrR4Eu+KMq4CMqGvCWYgg8ENw6QXbEZcYhTHmXWMP+lRZvdonlxnYTlLuHVbgED5CNJn
 07FSgf3Ie+YZtp8CJetmNM3CHmxb1MigaEyPGiWe3Aa42X2JHQMDOsQDamEgSZtLErl9nuM8JUl
 0ZAcNGXr40Et+HbANLb7SKk167Qp/zdDpf5D5PXQ5mE1AR36fyyR+c8ssumSSnF+N5c1LUcV9Am
 7tRntUzBsfQucwg/GwQ==
X-Proofpoint-ORIG-GUID: M8V62wuUKOFF-kIr8y8OkkkUfQrtkxfK
X-Proofpoint-GUID: M8V62wuUKOFF-kIr8y8OkkkUfQrtkxfK
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dbd237 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NPZjrCUcZ0bDlzM2A24A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167

I2C_DESIGNWARE_PLATFORM is default=y via I2C_DESIGNWARE_CORE, which is
enabled.  No impact on include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arc/configs/axs101_defconfig     | 1 -
 arch/arc/configs/axs103_defconfig     | 1 -
 arch/arc/configs/axs103_smp_defconfig | 1 -
 arch/arc/configs/tb10x_defconfig      | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index f930396d9dae..870e5291b7db 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -67,7 +67,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=m
 CONFIG_DRM_I2C_ADV7511=m
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 6b779dee5ea0..d45e4d335998 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -67,7 +67,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index a89b50d5369d..f986c0205f13 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -67,7 +67,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=m
 CONFIG_DRM_I2C_ADV7511=m
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 865fbc19ef03..6e396a9ddb8b 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -61,7 +61,6 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
-- 
2.51.0

