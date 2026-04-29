Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2321773D
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777488636; cv=none; b=jO/mpfOhcR8ZNZ/fvIvKPFZWC40CE6mrXDJufz/HdQX7HOM4PzyLTB7IBmbuOftZEAEDlSRIUqPAM3z33yqip73Wev0mT0uAcz6yz+IhKVrt3aiA0ilk7uY/PBUbGbk0zHA8jWijxqiFYt5Ab4qoQhAmH/yx71UVK5uNjug8VL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777488636; c=relaxed/simple;
	bh=HBHVal0FD6L9MTwIwcMg9wiNZPqpQBx28ASdmtU384M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fS9EJazJV8AJQx0j0+pMzguy6GWF1d/KmZ2olcDEtCrC+C8q0dx3Mcevu1vpEIOotCLUEyEuAM4L6zKkcFv82L5wcrA8rL8vu7CXZBA7Cw6TbyNyR3pACzcFzZrKSIdiwdP3pemteHuJrs1Fn48skzcvXX9vp3xfqaJu/mtlHR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/mk/Sxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM0WGquW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/mk/Sxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM0WGquW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TG5Skv3856921
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w3kpJ1YF1DD3iYW4MQj35x
	J5DvVrMxnWZA099SWSNrY=; b=d/mk/SxfjYGF5I+3MPAB3xkTFJwd3+LGrfhXaP
	3SGu1gzh10LlkLlR30ynljkcIITKBJ85UKflBEvDXpWSNDMMPKPbxUL7UaJUhkww
	fxJaoUiVcli4vERVXBNgC5Pn3UxS5aQrHxIzekrBfm3z16i8dx5OB7pntQr7wqzf
	eaZUZqp0bD08oPnwtqcBbKU21G0fAnAjH50pfhYra4kLQT2xb+Z7VMq0a4NMIeUt
	GMllzDx+9zejzDvLxwZpU0IJVvJQXbe7AhG/pxh1GJGdpiEvhhWOfLTiNvcWjsOm
	FWZ5KnRU2JWmp15kPVL6G5rLlNDmllnU2MBkkNTJe527buCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71gpvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso816481cf.1
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488633; x=1778093433; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3kpJ1YF1DD3iYW4MQj35xJ5DvVrMxnWZA099SWSNrY=;
        b=QM0WGquWbpNBo+XfpwxrkQbO4UIlvDhAeJCJ6/qweg867UMVbtQAtcndAoERKsnBHQ
         B5jIP0eIpfOFn+YjbUQ6F2lnl3zPkVDhBSYTLSDb9FC6z8wz0lYqg5nHHLtN6NhTOwnN
         EKi95tU5eOzw/8ZfCv1c8dinQnpIEB1DH1xBxXOdoWwZLHuGPuFXCaIM6vApS4PzzgBl
         RpwmuJSVCngo+7juPzXOHxKCe5VJZ/UyJ/dSl8XBUZDsMgQaklXGcaUiOAK35DMiUOYn
         Sa6ovYTlJCcELiqAx0K4lf3IssWxtiFc4gL4ETbxGDjWOqHguWApCTdayFXSjsOAakMv
         T7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488633; x=1778093433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3kpJ1YF1DD3iYW4MQj35xJ5DvVrMxnWZA099SWSNrY=;
        b=Znx0I8mBNNH2IUx1uF8upIXAvpoHZqA7JA/zpCKODht4n9mIfUMy5TH6fu7o+9Klir
         lKW1rKG74BzpcMfBBrcrZsOvdQKD9TgVXoWGXDXPtLol1mGR8cZNmivo7ERKvl7SYpRf
         lJk9y90uMiG4z1bTiz8idSysVTkliWWRLMaqb3WFUrAcmEMNAMSVq75vxuR6UUZa0qen
         QhCKf/rai6YMhXmavVR8v9pA2C+eI4RJ34sbjSvTDAHRzTWcgIFRT39V1eFpy8sMZql0
         9FbP6goX1SixhiYj2oV8KFUWp8CoG2PBpP4OqTQ0OboX+gmVe1/X/nlLsMWoPCLWXyOc
         hcWg==
X-Forwarded-Encrypted: i=1; AFNElJ9w1GYZ7ksKoWEsWhIwbcOVsd4MsXCbzU7ujbDLHEohvA+GuTmwF4V2tItXOM2UT1RtJmA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKUDgYOO3/hpCguosui2I3EomypsqbwhuRAHjWU71cFT6bF6Z/
	SpkTUVVl/B/XlB3zTth2y7LzDAtoPi4MTlpckNTNF0bGhZjtUOaKy3CvESbGyPYwVW5Wjuf8lRx
	dtjs78M64R1QcmlEEv17OkM1TLdpfJ5N//8l+j1Lr0pm5IV/7ihqirvg=
X-Gm-Gg: AeBDieuxhXNxwohwYZX7iRrKqA8aD01gFiMp2P/rnEJa4x2daOz+PuHUSzBySIHqpdB
	UTN4bertGQJOUH0JjEq0mjz6HxDhuIzTG6cKl/VrhkWOppiNbaOQPH1fct+xaF37fPjcDIYjGFs
	BqFOaSRSZ2fXYzFqtOt3YNWzVnLj7eByZzB42mjVHYwdczROovAu2gksLTi2L8VqxAP21JQOrR1
	yJongXs6c9+EHqUz38p9n4sFyF1Bbl42CMWIn4arsBcDh8ANzq6FR4btDSUK3c6YLCJKTxCjl7l
	MBh9TRnOn2+3m/+SjfeeSSdHLFCOrEGGCnab5Kkp5LL4UUPLGQsvccs/o1JKK1t/26/XRw8a5Ye
	TvKQmcScN19hfKTPDmIqCCJbxsitUCviotTptIWh+Qf7qtlRDrEkLI5o=
X-Received: by 2002:ac8:57cd:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5100e0f6951mr114508161cf.4.1777488632930;
        Wed, 29 Apr 2026 11:50:32 -0700 (PDT)
X-Received: by 2002:ac8:57cd:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5100e0f6951mr114507721cf.4.1777488632489;
        Wed, 29 Apr 2026 11:50:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: defconfig: Cleanup and change Ethernet
 drivers
Date: Wed, 29 Apr 2026 20:50:21 +0200
Message-Id: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO1S8mkC/22Nyw6CMBBFf4XM2hJay8uV/2FYQJnCGKHaAaIh/
 LsFt25ucpKTc1dg9IQMl2gFjwsxuTGAOkVg+nrsUFAbGFSiskRLJVq0xo2WOtGkOea2bNJzqSH
 4T4+W3kfrVv2Y5+aOZtoDu9ETT85/jrNF7t6/7iJFImqdlbJQRaZTeXXM8WuuH8YNQxwGqm3bv
 s5Or/m7AAAA
X-Change-ID: 20260412-defconfig-b57e7f9b5394
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HBHVal0FD6L9MTwIwcMg9wiNZPqpQBx28ASdmtU384M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lLxrpLsdOHut7VtjOiX8gPoC004P76w6lbXi
 6wVhQWIM8aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS8QAKCRDBN2bmhouD
 16C7D/4yWkW/Fl+x3Q9KV5n4VrRQVV7G+ErvA2VPxIfvAxeL7ia18kPjqzSz4q0SLSjtxCPTa/Q
 tllUpJchTE5+Hk2P+zIU41qaUOEoR+R8g0TEwWvPiBk/vJveK72WXF7Qs5knU/5DyB3FuNqxgLo
 /t5/AIEax8m0NWHSSvyrvea2qEpWWfx4vP1eTdfBpUjqhvHPOufMml0sX21uCubJUguj5FTWMjp
 Hh2T/iGRBcFk0zsTy+zP8hlbXG3ICr3SWr+fs1ulQDpjqz8blfXwc+ITUqke/hvYcKtEtUa/NVV
 TZuXzaj4pJPCv/gdFLyVRQ1955Mnv1J/R2daARN7l2NbF+IXY6NdfZnQDRNvJJikOZCpYiemWkh
 y8geMVf45qqJMeIKBtLP8HId2//y91ZbKmPJUfC8pRIMxiPKfXGdYEHN+38aYYhE62L+llU4bMJ
 OUDzZ+BtiViI+SyEq+Fr528Vf6z7C0kXTyrX8pbSzonZWA8ae2t1SGCTKJ1u4DCSm19roQwlZXh
 lYRh0OFaK/t+lanjq27QWtaiijA4my3FPvLlq6FOrZnuxBKECsEudOprePg6XOQKuPrOJ6u+c93
 a2ueP5BB0TSd3J+hb4ODoUtUTr7/wuTw+tiFCWG+ZpdH+RSyi54t779esYkfzSlDjBii7qYqkuP
 eWbJtaHpr9Vm6mw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Aj3GVZtjZe5P-FUwasmtoBXy-xArTC_s
X-Proofpoint-ORIG-GUID: Aj3GVZtjZe5P-FUwasmtoBXy-xArTC_s
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f252f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=W4zqwXEf2e1zRF2VhI8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4NyBTYWx0ZWRfXyNuhp9l0kjlK
 Cdfs7Y3S1yGXgNJxhbU1JNbUNwzt2m9yTUSMytiNzexYAacWaE/y3xee/lK9h4H6aIsSAEoIkck
 iNfeADajv5700WZ76kETjt5i7EHg0y/hjuQKfxFqGluNVVBhYBm3TYEQfghM78jrkJGM83So9Ot
 b40GIqDenuJcDZnmq8Ovu5y8vCEbvyy6b37xUyyGr3e9ISsZ6hLadEBpC+fzvUCG+J6wobPRw6J
 sgPvfTWV4nKiIAyvcpV5p0w7dNo5Rhma64i8YrlIuPEMmgTUyxvSVoii34JRRLmFKSR6VJsHifc
 EZRJ8BD1Lqjrk65vySpUVbey20ILYi5C6sIat+/vuqq/QZ8KL9W8C7Jfvjy7EfoppSoifr4HkyM
 OKSeaFOVEn3459mByXEx4AUT7taqMN4HkgZlJLOhQOdAAz/mpznSwK6EiIp4GNu5EK/Kd0Rayl5
 /Sqqr1Qnj+yjTsYQkJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290187

Changes in v2:
- Drop patch #5 "arm64: defconfig: Drop AMD XGBE Ethernet driver",
  because the XGBE driver is used by enabled ARCH_SEATTLE
- Last patch (switch to modules): switch also IGB, because it can be a
  module, since I2C will be built-in. Switch XGBE to module (it is not
  removed now).
- Add tags.
- Link to v1: https://patch.msgid.link/20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com

Several first commits have no functional impact.  The last one has.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: defconfig: Move entries to match savedefconfig
      arm64: defconfig: Drop unused legacy netfilter options
      arm64: defconfig: Drop default or selected drivers
      arm64: defconfig: Drop unused Ethernet vendors
      arm64: defconfig: Switch Ethernet drivers to modules

 arch/arm64/configs/defconfig | 374 +++++++++++++++++++++++--------------------
 1 file changed, 197 insertions(+), 177 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260412-defconfig-b57e7f9b5394

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

