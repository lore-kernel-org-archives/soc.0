Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5963628C2A1
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013975; cv=none; b=ik4hr1B4F2wDC5Hckp70LCXZrGxyH0jNIeGGReDVmXEdHhDOdD+km3LCnzHNlXZphxWNg30q/OfmDHiPqLiGFAnFJDYfza/WjRF26KWpFLv9hu3U57jIdXihQrmcMOkC6PS0pUjj5p7m0efoNE055LY8aLS6r57EJZMsGDK6si8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013975; c=relaxed/simple;
	bh=V16ee0StzK1dYlzzSsdKE8XXpyn1tb/4yuxsLyqL3qA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HED18+ePhEIc1aqpL68xcsnwk8BJ+82GzsTDr8ryykDDRhopnxftBAEY2dfjHeJ5TYJJq0m8goE9l2/e3Ly3hIM2U7bUnqV3IpEM1ERFccWGhk7EUTQ0pwnhEf97nqmM1cWo03UEcpYaFjHVtJFSX3KPMyYqb6ywCpAxBGRGvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXzz0EFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkTjz7fm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXzz0EFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkTjz7fm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5dci3690856
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=srk5XjvBrNGkwBnpptSv/E
	hlZrJUSD3XjILm85b82iM=; b=ZXzz0EFsDxvudj6fHNXF1Nj4wHRMF7laUg1u8h
	ugTVZ+koU5gvz4qO7GFYBQskNO6G9AG+iGzddD4tRt7BIoO7EfcHMT8HWkT1NdWL
	2HHb2hQTAN1faySF65njLS/PNxKj6KTgeEltK3XwALflLO28XMICYAKI/vFvmEMT
	MG5UB4mFT03GfXSIdi+2+zEMVEHr5msbIpz1LnP/GKst4AF4xOUAIdJ8vG1I7t/E
	DUCX7ze7PBEH6+10Td2/bWPUjWKb7R+Vk1Lo3vgsqH+PQNt7rpaMvn7MKkQ/gnRp
	hyGE3FJY7NIDHamvFQkz3pBkIcvyEwfty0neBzQXuqL3HHjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhtnvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:12:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4076dc16so70004871cf.2
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013972; x=1776618772; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srk5XjvBrNGkwBnpptSv/EhlZrJUSD3XjILm85b82iM=;
        b=dkTjz7fmocxo16MjrNxAs6MWLqOOjL8ICbmcWel60FfzZPBgE2KIyzClYdUlFftGMJ
         aIx6Jc23oPKwRvezFZL2BV6Of46Ly7v2A8AHJGI/7fxooHUu/3SM3TM41YBVGWZvBQud
         kjxyHR5Ubv3uIu1ZuIL00M5dBUFA8FNmYMmh7OHua+3RbdpgUlohdWPQBu4+qwYvjzmY
         X74dTizsd9xgWzV207fxiCxrP8rCr/LE8amhsK/yFsbTGq3WI6W3DzppgXwx2WBxYVtR
         lfe9/Wj6lRNKhrlm7glxsYXG5DQYG7CvToBj7yzca/XFfcOsu1MksiPmjfUBLkcC+Ny5
         e6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013972; x=1776618772;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srk5XjvBrNGkwBnpptSv/EhlZrJUSD3XjILm85b82iM=;
        b=XpXjcvRSv3kHgY+Pep9VGFB9lq/r9sxqdWHy/ijjHbMBPbwryTmi9pjbMD51KHBEwR
         GAeYG0bU/I8/O8ueRog05qhXDZBLZcRQspPX2YZyRMqE/OkiJo7HACqYf6Wlfs/1sgmc
         jRZLxUJZdDUqDBD22OPQVSQayQdybOVj+eBDMVro0r3XPMkQ8H9Yd0UAJ1LFPVtYLJOg
         WKeiaB8Pn63PXYHS6+P9n24hmo9/s28Y23NBmIhrofLCMsqvN0lsKZatA9BbzRy6Bjuv
         FFKBZhfEVEpic9XUVvk4qkSJA4jifD0RXWOAUqKBdMbRGIzUZrfQcY7UbBeHda8XUp3/
         8+bA==
X-Forwarded-Encrypted: i=1; AJvYcCUTLGjkYPabUudIKIzAaXOCVbiJcB4SDjg3T6nevvdF0uU3yrXQuEvkH/NKwKhp+KYDUtI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRYpd/7/6QmF0gqdVbvK9QsbdiCjDwXT5LKJ96VsC7BRCBJJCE
	zaYGVyQDaPdlq4bvWHfbgB5lb5BtLdhlCZv/cEgSE6j2VvjezVx9r5Llf8GddA845nxSZa63gTV
	gBfv8O+SJAiJHgD35A1YGIozDCwCsEkc7RMJtzEf3nlrEyhd2WGnKvCUOTi1nJ6Q=
X-Gm-Gg: AeBDieukmiG7AZUia2OEnVAiwsOwDo+9EDHN94gNvRidPNpTI5h2/pvDfmP6hrZ1wcY
	hSCGwD/TDLWqPWRcdvP5J82hYs8qIsdKrbStcIluG206IqmZsPpSBnHOM+cPzp3VFpyRl8fxwTw
	CdnNCkPoGlTntX1hFfd9fTMtB6w7ME3FdceZI92qGQlk3WYX4coKdNZbHn0VW20MgaAx3gsOw1+
	gDcXS1hPhUgXPRbZj6iWsozUzWFkTJYY0+gDSk6AS9+wz/IEDHaXIhybudxbRpn6xFSof+8k/Dh
	domDYBBNIs1jMyrL0e99Xdx77xHVYJoPlXC5LphE0msIiV4ynvvuRLt1vOA+Xq74M9sVV8qVbIP
	l0m/iLak4cl9IWdGl0ILqUS/8dghBmz9sZO/cgFPJebQR
X-Received: by 2002:a05:622a:3d0:b0:509:2135:ed5e with SMTP id d75a77b69052e-50dd5cc6a8amr153946621cf.32.1776013972578;
        Sun, 12 Apr 2026 10:12:52 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:509:2135:ed5e with SMTP id d75a77b69052e-50dd5cc6a8amr153946161cf.32.1776013971995;
        Sun, 12 Apr 2026 10:12:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] ARM: configs: Cleanup redundant options
Date: Sun, 12 Apr 2026 19:12:43 +0200
Message-Id: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvS22kC/yXMQQ6DIBBA0auYWTsJEIKlV2lcCA52mhYbUGNiv
 Luoy7f4f4NMiSnDs9og0cKZx1gg6wr8u4sDIffFoIQyQkuFTmNPwY8x8IC/+TsxLg0KI61uHsF
 ZY6G0/0SB1+v7am/n2X3IT+cM9v0AkNs2lHkAAAA=
X-Change-ID: 20260412-b4-defconfig-multi-v7-0619478fb969
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V16ee0StzK1dYlzzSsdKE8XXpyn1tb/4yuxsLyqL3qA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KN3EvhTueFPbGVpG9rZ/ezAR8i/lkQZluab
 YKgHvTuKHCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSjQAKCRDBN2bmhouD
 1zM4D/9S8VKwhdclDIeBx4PsqxFnep+SsM8ZzqiXkIz7KBQ3r8ZvnakUc2pab0TyJN+ENXV/5sn
 RvlG0s3foouJ7Iejfwyor4LrpvHpoBcF8I/m4lAGSBJ+wHzdMQkQyOzPd+IrEqfMuHzdS74I5ef
 aYAm9Aq8px6OM2gr3VktRTTKUWmQgPIg/iYEmOarvEwgdNcCeyA9PpcuWBKe5Q1nn8lt74uzCW3
 zCEatXAuBXDL+RjJc96zC4TqX3iyB+rfxqdoPA59zzJS455DZGf62QHQty+lqDtEwZMs4CKRxhD
 S9BQ6MW1dwXKfJN9hai/YYUGr6YJUfBYsau7ANq1JtjFlA8OJ97/H7TcB8TGiTdQnSlEiqClI7E
 TcNcE2ihTk7Ut5NHxj6w0eGvvOQgVKA7tDxgrRwVsEnPkwY26sm/9WK8XRAeDItiO9jqISd0aMm
 3yMdooyP3iOIg8rueg5yxnF6CjGqQLmdCN1yFbF6s+e+B9Rh6XFL4/GL3GC6jfyVTZjqXBEMYkd
 4O19VMa7/COXN7mv0uMlLAEczINNsPwX0yecjHw1sEzFwfpjYkTvneq5xSyTz4t4/QSRkvM/16k
 UWxRHNW7xLMNwzBy0FTxbBBX9St01+Mle7YNmeaX1TVvbb8ma13E7mvb7IkVvSLJHyLiZzG9Z04
 D73XNM7n+l4Jt6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX7PcTLL2QAPOE
 ncRQsL+A3rgGBswis+cJeNGugvimIyAuy/LcWpCEEXV0U76TAE7bGYBsJ8Bn7VKmetBHOR5eheJ
 fPnExesF3ORVYjRqaviJ+Ifo5YkQ1EGVj228go3qDuI9bFe54ZqG5X+T2HPv4tZ+sNUGlsHciXV
 wXX639GKbdj1bXXTSPDugn1tPXp8N/wNf0rtMruIgzfyF3s2OrGKY16MknB1FBCXMEuHAdjhBON
 WF8apS0MlAResAowwsxHiDdE9kl75sdck2/1dXgbP6+bO0JfQqgucf8hR1wexH+/OiL6rA7butV
 G4utT2rF2l53Emsv7ukCrhWkxgEignp0VSFK5z2ZhSss4o2TYA7SVyipSCvOlAH2gLUDi83+jjq
 peGNUYTZy5qgrK+s2b39OeEb/KxNBfC854tdyJ8TGtc0Yy8yA/7D/dlqWEwbIee3x+fYReTKzzM
 X1a5sfhjG03320QiyYg==
X-Proofpoint-ORIG-GUID: bTf65L5oqsjIa7nNvJfoUkUzQCiI0arg
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dbd295 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BXN8pGxehkP936TjXAoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bTf65L5oqsjIa7nNvJfoUkUzQCiI0arg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167

No functional impact (verified autoconf.h).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      ARM: multi_v7_defconfig: Move entries to match savedefconfig
      ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
      ARM: configs: Drop redundant SND_ATMEL_SOC
      ARM: multi_v7_defconfig: Cleanup redundant options
      ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD

 arch/arm/configs/at91_dt_defconfig   |  1 -
 arch/arm/configs/hisi_defconfig      |  1 -
 arch/arm/configs/multi_v5_defconfig  |  1 -
 arch/arm/configs/multi_v7_defconfig  | 95 ++++++++++++++++--------------------
 arch/arm/configs/pxa_defconfig       |  2 -
 arch/arm/configs/sama5_defconfig     |  1 -
 arch/arm/configs/sama7_defconfig     |  1 -
 arch/arm/configs/socfpga_defconfig   |  1 -
 arch/arm/configs/spear13xx_defconfig |  1 -
 arch/arm/configs/spear3xx_defconfig  |  1 -
 arch/arm/configs/spear6xx_defconfig  |  1 -
 11 files changed, 43 insertions(+), 63 deletions(-)
---
base-commit: cc27764c3072c53e1b5df83fc2e46fe1e99b8c19
change-id: 20260412-b4-defconfig-multi-v7-0619478fb969

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

