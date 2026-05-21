Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AB175A66
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377412; cv=none; b=VoFcybtBCxCsjSbwrfVPVLEbASDLAw1zVSHBUzvXMcz9Yh7zZBljtIRz8b0qDTPwDv/1NLDkURDU983pm0h8ulJ4klhaWhs7kQyEuJwnPcXSIers3Ov8EHrdG5utbon191/JnPDyKQBm3pKczL3KxO4AjLW7zdxahqxC7i4ChVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377412; c=relaxed/simple;
	bh=RbEm7iffJzFH6G/uVH3VQxbK73TMWZ6jXJahOI7XdEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q8tqnEgt4t8w6wEEaQInhxQ04zt/gbPIhdvW+1lmRuXHw7Y+C+WvFhAJsZuCyx8ZvGnfMqJmWPUlHkw3iPdioY7GvorB9WPP6KBFm1wxl9UVryWd+XayEHNmWdQhyxSjgeMfterzVgCWOKtW6aWFj822RoP3gmQyG6vBe0Pj9xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfCLrCfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYVn7BiK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfCLrCfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYVn7BiK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LEx44v3009667
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LCV+/nbCUttCbjBGWjXzYqpie33j30l0mLU
	2tG8d+NI=; b=AfCLrCfsFE+yf52R8oo0NZHi3/HDwzMzVE1F5wb0reYPLMTZLEp
	UoDUEFjSxLhi5M8/d1RrfOD1J86+5iQ2rxtDeFagE4dHJS7Bfbvjw3qcFqvmpJFl
	zZR6Wi7JR88JOG86kmoaWhLepC22QpU91j96AojwEXblpEd9S1cdCqYz+YD54Wyo
	9Ubnnb3mYa7OqYbESUdPDPTNBZjFGVsao54Ut9Bbz2CYrjxjxtNzZ/rO1ribgj/Z
	S5xRqklujUrYSoqglsyGm9dlpA+EQ8MvYOlOb3zKXiDlsU4eRvv56cQKJclPK6ns
	fs0gPGDhLy3CVmgJPFmKGwjz0erbmENzmzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr32y87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:30:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516879bf1a7so168180371cf.1
        for <soc@lists.linux.dev>; Thu, 21 May 2026 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779377409; x=1779982209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCV+/nbCUttCbjBGWjXzYqpie33j30l0mLU2tG8d+NI=;
        b=RYVn7BiKSMo/dkEwZs6K+z/1SqDvY/LwanwOX4vKDNQjv7y/aU3ddcM4Z6uLDMEII1
         oRH+I6sDJuYrC5SFVNo8P7HHzwav6Uq4ssVNdbOrBBEg4iC3LYs3SpqGbYTuo16LvGzJ
         EE1KpqaB92k6P2Z6ace1nXJIyPlj2mOEXsj6qUn2KZXV6Ayrkrbja/f08TydRGQJBBWE
         oV5APnzrzFfWxNK71pla1MJH6xbIXbKHei0tJqZmg3F0CVJHq8INh3nB6Ep4xkjqHv94
         tpiWEB4LvP7n8KvEiqFGDmnpYVfFPg190c0wHn0qGYBYWxt4JnT/7gf1NZYOjnrL53zK
         7JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377409; x=1779982209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCV+/nbCUttCbjBGWjXzYqpie33j30l0mLU2tG8d+NI=;
        b=OINgLxFDWnokeWVJl4Gl9WRkz2nclPq9Sc9agcuz2cRzvHScUNFCi2jq0d98Hg45Lc
         3A2+wSnj2LGHBqxq6Vjt38GV4ofSkcUkvIbZXbKYSa6mxUkh7ZjIHGf87NeRnj0cwbMB
         63C/VEua/OpV4SPCSOCCDHETaQQx2l91A34qNDvjbyZ8tGezT82SbomM2qUbyKE37UzN
         vFWJSfCqOt8Eh9KI5tduksSa6cYYgeYYr25vDZpeJQATE3cr29tPnmtjdHJuYOqgXtB4
         cS+x032OTVwd1zW8xVbPVbnfTLCOy9SIp6GkRdSBN+EvQP4u4nD3FAatn9spfLByToWF
         +O0g==
X-Forwarded-Encrypted: i=1; AFNElJ+mykTP5oZqTqRo/QfMZzOenwEqxbVAldEVlkhsGp07czNo3VrRxF5R/N/OFMCPW4lO7xI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5z9wM8p0wYRWPefdN2vJVF48nzeN6cnWe9HuEoeQAj9ErjMrL
	7Y7aSNjIbbru5+7kBtgCjkNeGBoYJLrmuYtb6y/k+JlNcLyepuUDqNUptIuEWFnqZBV90HrXwhi
	j78haT3mgqdZLrqMctwc9DwS/lQmxVAqKJOXST9v46rORD0Qs8XmxIlo=
X-Gm-Gg: Acq92OGTfSRr3kJdIkVRMylArnSfqZ+SEL08n/yMrADglgv9RQSfnURPgYf3HS6GbyO
	WwLOKg65zLi6WuYf8u6gZ0Wghf4yhg5xr5nq/LHFxzGROegSXSj4DkVn1r3EJIffSooYZh0CeEC
	t+CV2b/1S4Sm5nUL1QAGEASbXwpjg7LxlF7PvH6oi7Xd7Ht7Tgzogx5Mw4f3tgjUPqsU95AxC+J
	Z/UE4wzyGOH/CEthO/tDqg5UEyyuHboUAx7mgaFT2csVkoagsCeglSkREt7PxCS+snsbAELDQfX
	kO1UFQ0pMPnDjKZusQT0jCG5iRpoxJxr/sc6HsLPKutNgOglzbETxjehvZemObwpNX2D4VGZMsP
	6TmY7y0cI1GOTgxF75/ubHthHd/UAnPIahFmw
X-Received: by 2002:a05:622a:d0c:b0:50d:a8bd:dc07 with SMTP id d75a77b69052e-516c5652942mr33616761cf.35.1779377409025;
        Thu, 21 May 2026 08:30:09 -0700 (PDT)
X-Received: by 2002:a05:622a:d0c:b0:50d:a8bd:dc07 with SMTP id d75a77b69052e-516c5652942mr33616211cf.35.1779377408545;
        Thu, 21 May 2026 08:30:08 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c595e6sm33093265e9.1.2026.05.21.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:30:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH] arm64: defconfig: Fixup duplicated PCI_SKY1_HOST
Date: Thu, 21 May 2026 17:30:04 +0200
Message-ID: <20260521153003.429610-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RbEm7iffJzFH6G/uVH3VQxbK73TMWZ6jXJahOI7XdEY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDyT7CLESfELHRA5uncrrgJwb4H1UbNUhSju2q
 LonqyMs1XiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag8k+wAKCRDBN2bmhouD
 12vYEACSD4Jk6gviekRhjQ+o+3EySUK2+s+jNhQsnCWpvvGvLMzbyYDPoFOfOIUHj12EkBYq+lR
 Lmpcc9vKOF2LSeoV7IhTQGPdSs8rUOnvbVjdNyHEdjc9SCyW+S50TaZcCzQ/PqNlnQDFNcwq6YB
 ogSuBneo1NlxFz/+kMqeTvHtodHeegcPdshS8F7vEzAR96RzG13sKuGwx0MZnqbsQQZfqsHtDD6
 +aY2/HDgQUs1st7J3vT4DuabeWZoxjYHpTnTTe+HcuOcNjJsUOYjsW4KkwplXIFvixs+gaeXhlz
 Wwmcrv351uGMd2oFms2d+n/ZLlNiGnyqNfvn5oK5PjT5/QgzvI/oi+LEcCv3seaEop76fO2G2yO
 s6xbm53+E5Bq9N1Xx7che9EnLw4eY+SLwd/GUwuK8u8Khtje5+YLCQqHIJHjJ1cnNmQ1un98A1G
 0HMUtF1QPy4y4+m7rrbwdTMzwAKQ+uuJmCHm9tHcvvSEHikq/eXvH5e9St4WRjzk9vl+9cwiC8j
 0DWkG5Y7vlCuHeW17X+vzid14PI+e1oHfyqPhC/tz//BeDZvhCUSWJCCxXFFDl8X/GSIwMkdYA7
 uYtDcmGNu4NQ3yw0ZsK+cGC6DHkfJFm9J+bAIy4ROg0RUchEyCOWUqokDr5242ERa3piJoFYyEE xAY0NozMoiigGoA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gztSaRchrp00PDR4LvfcVGZt4m7jh8_g
X-Proofpoint-ORIG-GUID: gztSaRchrp00PDR4LvfcVGZt4m7jh8_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NSBTYWx0ZWRfX7ScSwf9cvINF
 XJ6RnnfKEaN7iG0z41VwwuO/l7KQel8f2AMrQwgk55zGhsQYBcfzT0YmFCVeULaG1P1EHhxZW2f
 Mw0XtMZM6ws+Z9TqpVU/cVDw9KFAKHZVdwSUDYZ6YhIUoP9NcLB2Bmq3tdt1v6MT+g6KZg+4mZN
 E+x7JHKjWBLP5CF9/axXKsPV/YVkEDmOQVMB1amUw+Y7DR80Rjzxqijxds22RljFAE4jK7aql3Y
 GSaBTMpuXf1oItWJe68gkPuF0SGyufQYE08z4HBppwMPyup7Xwm96UpWcfELvF30PxuSsEfIdF0
 ivCsca2pY+JpDpIwxxHbJiZlYgZZWDFA1BuI5daNMx/Ri+BscnXF347C0qWEVsJBme2rsEaqoQA
 /LAAJkqZfOGCjj5D2NxrLMsqQ6AxuLKZyO2gGuyZIjDg2VhHjvcnbkjb+1dCeQXO6T+cad/IxM+
 tNhg6N9M1nY8PMeS7eA==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f2501 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Qe6B47XUAAAA:8
 a=TAThrSAKAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nLu_DpVRrlUwSt4cFjoA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=kacYvNCVWA4VmyqE58fU:22
 a=QWPKR-PWjQKaio0naagv:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210155

Commit 246e37739f24 ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe
host, and Cadence GPIO") placed PCI_SKY1_HOST in wrong spot, thus it got
duplicated when merging with  commit f54f7979ff88 ("arm64: defconfig:
Move entries to match savedefconfig").

Cc: Peter Chen <peter.chen@cixtech.com>
Fixes: 1440d446ad5d ("Merge tag 'cix-defconfig-v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix into soc/defconfig")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

https://krzk.eu/#/builders/102/builds/72/steps/10/logs/warnings__1_
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 340313d48e0f..03a057f90527 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -234,7 +234,6 @@ CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
 CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_J721E_HOST=m
-CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
-- 
2.53.0

