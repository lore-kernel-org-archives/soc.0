Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94124397686
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 07:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066259; cv=none; b=CuoE7hBTezG+DZhkS9l11chaAnUO0bpfBvVKLvMDu0eGhRTU/hYXuwBB5ln886fWOcz5iYW1nU+lZR6gZaAR6Vy5RuOQ1suYIt8Jd4uDByWsg6huVn+pFJxhJV6sTSM5DRxEkOHXwomyt81VNq/8URi+6mBrbYXVZ3okCUsuQqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066259; c=relaxed/simple;
	bh=emAvh6toXGOd5B6fz9M/oSRBGye5L4QrB2xQSA35mQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCGiXGEYqrwyfhsUZgI8Aaqglcr8OifYKRGj2a4CQx0sX1GgS5+XqedSdMiJa11WYj1ZCSc097zQu0rJFGYtL11MtNbYwvLUmaK0ZtWXmm8X3xTRx0wbxKKV0DomCrzoDplXZHdkhN1855acBZplhxpjbqqm45VVRBav1xd4OEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AyBXHeun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFtQqDGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AyBXHeun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFtQqDGk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5tADX3315177
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 07:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY2
	8YsHhpYU=; b=AyBXHeuncUj2SlqQHimyEvSr0VpXT1UnTu9I57tHajzg+BhsxqB
	VT+gFyGFZ6IAVYuM2rASS0xVuwiB1TwPF6ezaIq083U1qmx3AY6hMxfDD0DNbvuI
	JYF7icxAQ379i5wVBy2uxql/gKmxvbnWroewB6HKTJn1AO4VSc/yaSUm4PIVmloP
	Ly4sGB+gbbmGSRXEu+feMu7hnVOJJ8H/tINfcfzEZcelsmKko831AjK1h/i9Bqi9
	hWSKVAGapE8mDpzb/pv9Ql5UOZprHaHSYbNLFWayjLRn56ZkexKZr+eOwUB8JESZ
	/r9DrowfD9yUIteloRcd7K/mTSNSDzQlZRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvayq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 07:44:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b781542c1so78810741cf.1
        for <soc@lists.linux.dev>; Mon, 13 Apr 2026 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776066256; x=1776671056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY28YsHhpYU=;
        b=fFtQqDGk78Mp/mvPXsIT/M9lidRzRihRXaPjYuGCmyjuhA1++qX/2MPEq8AZSm2J74
         J4F0M1rO9F8f2dzr0ZK6lQvujnm67uLC766eVdY1Xo25+31ozhN6DzefCRCh3WJem1Y3
         ks1/OZQwrk0BJoasquDdXmW2dklZtwS0HgBtvmNc403uDLakgTs/JZDJuXKwKvRy9eey
         S193RfygulWEHouxDhEJjLPo/BuT7q5cOddxLh7TOBbjWWCeOYYTzclDARaoYgl1tgH/
         xgCzWHbL1DIKofCHWJ7/IUiS8ivwjohEy+psPTKs5fxGknhJRuVZxDkUbZCLRC6jp80L
         bx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066256; x=1776671056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY28YsHhpYU=;
        b=BEL1lF9PyGOiLmlF/X36M2sSAXPurw47pyXj8o6Fh3Qw2UUKDqc2tm8CKTIny2ztCv
         nlOIb9sfyrdjS13XRT1YUhVzheJaK7KCSEuYm2HLk23F50SMmU4+K1+rDxUS3TFv5vjD
         psCXmlap7TIOHtD7OQxjAYfVIC81W84TaBiwYtp3TY5vTXzRIgbDvPK3BNrcFooPE/UQ
         7Cv22MpA0hclexFkZd62qeg4dSkahWNosqp8Q73nDIYcEtYA6LdT/CImdtrfzZ8ZtcaF
         8RHsLhGwa227/p83pUWkrTQHrA2suosHjGtKB/S2cTePw0FEeZ5O8EhlCIxHiMGV4NEC
         vzhA==
X-Forwarded-Encrypted: i=1; AFNElJ9nL+L1jlfBepxzWUGP89i8SHH7m9DgOUtVkgUMCj+czf5WgtfnIOsvgL51ZcJ9mrSmaJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+zK8eyyC4SAP8f6aT39PfWcV2ryQwvY6gsNkavBRQeMxt2cwn
	Ucd1da21y/vKVeiLalLb/sadIGHngdMqLYK/1/iUXOOajjQs5y7f0zro6VjdM4cLxQZ1Bvs9VqW
	1K5bNeb5ssuYXO3D6T6B7arFelkdxBFr2MoCuvfsMvnR5HzakAcv1nbQ=
X-Gm-Gg: AeBDiev/IxMNjGfEIv2eMzXXROj/oiwSHTvVd6OeW7ShtsQanN5g/GrU6S0IZBxX65u
	VD472wwbOH/5fD2DijLUwIc2XobuvVNzT0X69Xo3Z8+07jsdjt38J2gqH4M/fIkGvxuaZ15ENmX
	nmxfkpFiDlSXt9AGOMvet+l4OTWOrUiZTdM8XAJ36t6G7wufSEtPyv+9CYhO+wpNvnAZQt319a3
	puU7RWk15HnZJh/xAm41ibzDI3obNpa9Wx7rtpZa43t0JZNmw4h/9Mtp6o8aGFBoZDlzKjWmsr6
	C8msZtB2hwjzPIcF2h0NoNAuoPUx/5nzLuZW9VLs0kgNBXpezYiovSz6mCxai3C3P0JWumpQxjK
	9wDcRoJwDU8ZbaxpaKow/incVmxgOP/yL6KkT
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr172964141cf.22.1776066255692;
        Mon, 13 Apr 2026 00:44:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr172963821cf.22.1776066255250;
        Mon, 13 Apr 2026 00:44:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm137465635e9.3.2026.04.13.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] Documentation/process: maintainer-soc: Trim from trivial ask-DT
Date: Mon, 13 Apr 2026 09:44:02 +0200
Message-ID: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=emAvh6toXGOd5B6fz9M/oSRBGye5L4QrB2xQSA35mQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3J7B9CNNwKiSkBiaBvTBEt7nJ0+9KfR4CI6jJ
 ReGlcqSceeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyewQAKCRDBN2bmhouD
 1/2wD/9L24BCH+anyswyq/Pmf9FjSqqRahmQhA3Etm/mZhIjFMkR7SmeIS94BhUgJ1CTNj5Nzrz
 GulTVM6c0ublpzeEtJJJvQ0IOxUWo1d7U1yaSxWdplLOdXNMTkJNso4LcT7ImlPimc9wIzbJbAz
 QgFHg/4XqpKgRqY2MfWixigQ6K3Qr5VtakXiJ8FX9QN0TnTCWhDtadNIEHwtdgVpDd3cL86VDXO
 5VXHTfuGiY6WhqwU1cDx2apqEciWxE+8EnQ2alx/ndl5+sXsGmnNSG1usVNKAN3kaSxsGdQPUI3
 0yEgACJPWScLQoecEZ+F9E0VQezmfyDO8eGY4Q4wMDWigvvXK4c1a1J/Mrhgt6K2QcNMi4roudX
 E6eLr+JJtZ68hmfkXyFcrjzmYNloQ0Wnh1Z92i6KSxCzRZJLMvCwC/pvdBgpvD/iNDBEk8l/E9J
 IptP1feZNdAcY1jJ7JyoxxTNrKP9qewZYrUvs8DcyGCoyOJ6a3JwQT8EdPcw4cN0UvgIfdNxAQv
 KOclVDo+A7WIc8z3kA+dW8AZzEDyn7kg3lHooWQO1D04bnlqlK+YfrplJJJN2t9ZLBC9BicXvBD
 DCClGh127H4DYZsDyTAgqzbkiwTy7UGVsr08momrz7NrSfZIXKNS5hjgqcd/yjCnUZ71MQaWS4d q6mSGtE0n8TVtrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dc9ed0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gmrGOGr7E6VI24hohNgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA3MyBTYWx0ZWRfX98RNVUZdldeO
 avpqamucWJdR+inmASKguCIMTZHWPDyC0zSKe6q+dWuWICywIVYr3NOwsGJqhm+DFWRthg7hBdG
 8CpvfCiXZyIMJBvuB8pm4FzR8oTRX4lQYqbDbiYlrbcCxwIUiOXzSyj1YQLAFSRB3UxoMcBCqF+
 m0Xpgv/S4BTVnqHfJkc7R7lndvyudXFo1OZ6lYUvrmWiZTmx0SBL9EbukUw3+OlaUlXy2LGRi9S
 CfIuHDtf3NYFsUr3zKSuflk9NGhhqiAE5daqSvxB57h3X5lgxgaHdIQsuyL2uPK0AIzOypgEkbY
 7sAmxoA8/AzHbzK7GYYjihnBydpGF5y92/1u+eSc2clOt3WrCfaFpnyAOXv73TlI9Jy4YXlmBCk
 fdlelh126hRMz+O1Sbwe74ITAxrHcOKELugA7pvSiIMOJWFgupgrOzoU3Q8NYguaK9Zzwj93DUZ
 ip3V5I9TV9pZif/7FSg==
X-Proofpoint-ORIG-GUID: cf0zNZLtz_-dSWJsXcJl9jT899USGYKJ
X-Proofpoint-GUID: cf0zNZLtz_-dSWJsXcJl9jT899USGYKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130073

It is obvious that one can ask DT maintainers of something, just like
one can ask anyone, so just drop the sentence.  Concise documents with
rules have bigger chances of actually being read by people.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 7d6bad989ad8..4029dc6938d8 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -169,8 +169,6 @@ more information on the validation of devicetrees.
 For new platforms, or additions to existing ones, ``make dtbs_check`` should not
 add any new warnings.  For RISC-V and Samsung SoC, ``make dtbs_check W=1`` is
 required to not add any new warnings.
-If in any doubt about a devicetree change, reach out to the devicetree
-maintainers.
 
 Branches and Pull Requests
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.51.0

