Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF830C632
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013985; cv=none; b=ZGTIh21yLjFcIM0VQFRPYugP/wSoHIR1wIQvvbiyCXBkby9Fk9N8rHSPLaxP6pz2bWLZg6iFA+Pn524YrxP79jPEeJY1XEBzEd61EZIJXp3P4vNLam7w7XcfAl1cLIbvS6+4CgD05G3YoNF8zmsD/KQdOY/LUmxvDQTOdvoeuY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013985; c=relaxed/simple;
	bh=wEYAV5h3ZypSxV89EQNiKmAgaFdkQMYELTHmmNYH/Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqzi9RXneg/SEjiWxgD4EIr91JmRhoxvQd4nYgmq3GD57Xt8CZ3lOyfc8EVa9gp0cAjBr7aGhf98MCqzLOqhO6u+/sjg8mAopEfv1VweiKmnrmS8pRtN6FIs4r06z2zWk0SHXrJxpwz5G4kvxFr1mYugBUd3NZWwof4YF758RzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGjNG6ZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dePBp57v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGjNG6ZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dePBp57v"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4dNr1633907
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yHqPy9452OV1rd0GrBkZHUJHwoVr/weQUOYEivz1UIs=; b=WGjNG6ZAVrKjB4Eu
	GHyNilxI8K/STwBqR+nLyhFRI+JtCsjON10S0pnqCN+9kRH8tIv/GmDGj4rEHJT3
	GEebZsVrhKhYlNYHeM7m+JCdwBXOeH066a39YJI66VraG2j5ekANkeV7Obkr5SHl
	ltoXL9Qx7VuCx7RS3WJdHhpdOZpGkhs92ySeHRLYHGoQmQSeDpoXRzH/4L9eRxbv
	FFqBusiUOxMglOz+sjw55J0zNMliTQESZ9ctn48CwjHD7aFMFppzTWv73D9ePIeY
	Xc7oJvuYZ4VKK/phOGEg2noOiTYIGz1CXRizT6NQZeTx1Xh7JBJyYQlw0mwtzKNc
	1BeFfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6jpk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 12 Apr 2026 17:13:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d831e8083so45513591cf.3
        for <soc@lists.linux.dev>; Sun, 12 Apr 2026 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013982; x=1776618782; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHqPy9452OV1rd0GrBkZHUJHwoVr/weQUOYEivz1UIs=;
        b=dePBp57vLST9AoX6lh10jxam8X6KCPqV5xPrduAAzX2YKCJE32DMzUwh6YN70m3t7N
         mgsA/TeS6lGz/Yc2dZoEAHsQY5oRa45h9ALVFlbYnauURsZwDgWlLvhchLOSumSi9ct5
         t+PaKi56JSNa9CIVjwWHHj5GneetJqLcSuLpALrTVhzlbjufgLuqn209xqS7/wYbA+mM
         5tw3hfw9/dJqMlOvFwb9JvPQxQUcRN2SpMZJ7Zf5JZmYgofdmKJFGePtlFbMw1Tgi+If
         dhB47imFtlh3a5qEWIWf13csY86tHNqjJCX73+tBYtBYhnBonw24qkKUfBUVy4r/oA/+
         fYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013982; x=1776618782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yHqPy9452OV1rd0GrBkZHUJHwoVr/weQUOYEivz1UIs=;
        b=WAWi2P+X0KeOZSz6O+prpx4L+CeMgM7YJDXcJJp7+QgM28lB49UupS5sonvyITL/V6
         0eSxj++qynJzesDKj2ryZC65Oe8BWdok7m0KY+iYiaQAMc8jbq14DHAHKnFFoDNFEbAW
         qtayRw9+MJoWfyjir2pFkGFRO+CsK32xJCFSa/zkXlEYbsSM+7BjWc99NQUoAm2j0q50
         84TuUJ5/i8d//5pLOLJfu+pTLW1a1h0XdVXXc3IHgUbgQwTXGgkbWwp3OvCeW5xqB2xG
         CH9fXl6YBMENL1yAebsq4nHdMo1M06wTe9geOPNaRThAukO8zSTGd2EYqY4j7cSOfK33
         8O+w==
X-Forwarded-Encrypted: i=1; AJvYcCUp3LK3tS5AB3M3ohJOO4PdRDexEbfCeqJeUiXn/LLLctcBcnBQD1Ii6W3QKqhgpI16AJw=@lists.linux.dev
X-Gm-Message-State: AOJu0YySysNR+F2dudLvPPPzWqucESrgVkvnj1WeMbArcxuIW39QROYO
	tB+E3KOV8y6JE4yFhoTqo0VQiUvxn+z8QgmfgBVT15Ahxagg2bZe1xOyAnxfxNlFQBMjobBjDrz
	iSAJvKIEETc4K88CmOE7wBT8103o7gIuSRuZuqb3U5eDBrwd2R2Kd+pY=
X-Gm-Gg: AeBDietP5YJG8GtGg/tAc745jFU7qQAnLsx9UPLwe3JDtWmTbZ0aqbbv1rTU5DaqRlf
	OExIxkqV9T4vdfyfP0MEx5ymawZmV3aX+Bw8I1OjJM0B8nqjLiqg9gWNBgZ3PL8fKSV6clUVIqy
	+gp2PiGf/CZDhwUK/iHJkmuFDhFmYPEfRhDFLumz7FERFz6qqGnJL3DFoL9/0jtBymoac/Sm/Aq
	F2/DSVRnBnxYLyzv1x8eBt1e9ZxRnqThWbKZExsecnmQ6APpfi8TEeKtGKrXJVhGfsnsLMMCKfT
	DwCDS4aYUb2ro4T0v731534f/PP9/bLI4tY3cVDoAsl8NvDmbR2QZN5k38Jygp8xn8PMrzGlFMz
	5MOReoVRq6gCGTRS+qpCuzLwdNSMAyzUKaIbIkUI9Jw/5
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr171621391cf.26.1776013982422;
        Sun, 12 Apr 2026 10:13:02 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr171620861cf.26.1776013981941;
        Sun, 12 Apr 2026 10:13:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:13:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:48 +0200
Subject: [PATCH 5/5] ARM: multi_v7_defconfig: Correct QCOM_RPMH and
 QCOM_RPMHPD
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-5-e76de035c2df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wEYAV5h3ZypSxV89EQNiKmAgaFdkQMYELTHmmNYH/Eg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KRH/OkMloWyWX8eI15BKYO+AjvAW58VoG/u
 ed+n5tKuxaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSkQAKCRDBN2bmhouD
 176sD/0baYJg1pUAzOINXpihfdHhicvNtXQXsokzmJ6Lx5u/c64I2Xm+VCoFyYTL2NE2mx7WobF
 gnQNF5KhUVWE7MnvtI8J6vLif9SdhYxQ+OBQIJJWHiam5ZYAXqz8/hfonL65S3WqE9K10LpbjRt
 DCasEJ+BAplwK9zSBjYisNZgAe5HNz90WppILagbzW1Q/dwBXLxfqbLS0WvkOEi2zDeb8WNPogt
 DhWzHKRzD4YKhCiOO3PT+4gAv3PVkiisUX/twRr7MfktZJPBefMaluOWVGgUIMUfoP8589aC1hy
 PQjVxQWjSlYIzIteSKjOfUS6bGk6lAVvSWbkX+5pvzTTvJZdckPAKAf3lEmzV2oTZSJVFnyNOiu
 eeHhc7tIVfMver6zRKI+pz7gM+iVjR2tf+rrpV0pfD7CWhRoHPwXuCxWXCe9lRtL/EknbNOW+82
 TN5sckp120cxHZWvYXIqOE1jTH+71sLCwTJRPANX6cthyo9ih1XfNZ2OpFQP9MDaCZWkImh2sjV
 YPXplBKSvEvqRES0+lVWbr2IUlSCO37WQ8cc7eQwI3lv8EktwcdENxlUMt5azGdppSEG3S3nP+9
 PtolZXpx9U/954/p8t9+ycdRn+ucsEJR2IrCJNZHnKAEOSB9YX7H2in3tOjZqnuVLn210s17L1s
 Zq9IRVmvYtz2e5A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX5qBNH3hpcs88
 /9radNvvuzhxv8h95ftI+oGQRHOUBIgza1rAmwlVw22F8E+UrzX7rf8GK263LvzGGsihx810XRs
 vVvHJiNr9ALXmrtSXnsXW7mITcMyY6Q4119slVUc2n/vf1/FWA4C7E9w/uok/nZMZGFcl8DrzK8
 Ew2AOl5MRSLmC2hCrxH8PwMpJvCCUs0RC9reFU06BKI+sHMlgm9j5Dwe9pB/vnm2/T33lhVy4tG
 KjChRZnOYgD6w72d9N53vMPVk+DWWdEZSSgsh8RsJCZ/1SuLSo01D4/aviBeKW86IDJwiIC2z+H
 LayS/cMmPgfICthjTi7hOhWG0z1que0HDq+DnuIHXuMGq626VYrI/LHSxccNNO1fQ1rQvcbWV4o
 8XEyc2KKN0Nrv7TTpSg6aBVExPN51BnexwwPTq+PCBg+GK6IotW17HIheIv3lMiDQUY31AmTb89
 b53Jqhxg2kY8FPjLong==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dbd29f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CQzOjKuoA5NHZMXwxhoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: hpuXHWfiu7BSPWDQwlnHI9D1yobCbgpb
X-Proofpoint-ORIG-GUID: hpuXHWfiu7BSPWDQwlnHI9D1yobCbgpb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167

QCOM_RPMH and QCOM_RPMHPD can be build only as modules when
QCOM_COMMAND_DB is module itself.

Fixes: 1c25ca9bb5c5 ("ARM: multi_v7_defconfig: enable more Qualcomm drivers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 520e2dea77f2..f4f98ea5c4ed 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1146,7 +1146,7 @@ CONFIG_QCOM_COMMAND_DB=m
 CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=m
 CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
+CONFIG_QCOM_RPMH=m
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
@@ -1161,7 +1161,7 @@ CONFIG_KEYSTONE_NAVIGATOR_DMA=y
 CONFIG_TI_PRUSS=m
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_QCOM_CPR=y
-CONFIG_QCOM_RPMHPD=y
+CONFIG_QCOM_RPMHPD=m
 CONFIG_QCOM_RPMPD=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_TI_SCI_PM_DOMAINS=y

-- 
2.51.0

