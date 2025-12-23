Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D28F33555B
	for <soc@lists.linux.dev>; Tue, 23 Dec 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766500057; cv=none; b=JPb9QxsGdg4vnW8z2X0rdxoU+O1ILn8XddAZO+or37iH7dNrkKdkj6QIPvANXUnSLUe8yJ2q3CZPc6CrBbAcQ6Z+9pBnq/wUDoraFUwjvUyryvONnbJqK+WricSHPWahVFjO7yLDcdoDiYh7VN9NCrJMOPxvP7pRTZk8aPvPA24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766500057; c=relaxed/simple;
	bh=8d1DDUBn0OgxirOWILF6DGTSvv73dIacjmoQNFthptY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLEiyTjC9VHyVweoqDVl3F52khK6+SbxgYDVPbZXCccpZBpS+kcowkOwjzj7Qy3YG+EzCuLvUGqhFgo2ucJRzg7gcl7H/8+Qn/acDq0QBgryWOVAzgjffUYA3Bi0t9Iq4Le4pH60zOz/JOfnBVWe2DRzlDQEGUzNMW+o78VIaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ts1aGRhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXyE1z0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ts1aGRhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXyE1z0C"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9rsEk1889299
	for <soc@lists.linux.dev>; Tue, 23 Dec 2025 14:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mnNQYCjDT2I
	KwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=; b=Ts1aGRhfiaAVeQUqMAEzULUH40M
	qty/l6zFIx15nNMAVvQ0BAlJ5rhNpmjTixKsc4Y0Dk8Awjl8sJbtSyK2BwqQ5ZdT
	YxpZTH1sX01ztcOm0Nw4hwrUzs0qzLHftMImAIH5C1PgF+d/aXQVpVajPLo1cRbT
	k57lfTpRN2ekwFs841bfi0ybBb7B+5TiySjajpqr70PPXc4fwFo4Xoen4wqCQmOP
	fkSntDIfJQLTGKmLS02z1suoIEGILpZpjdk08OQCzjnlefSjyAQPBHS93MO3XBy2
	MxXanXI1yXsJux0+/hBEbcE0MZVv4YmU6KzVF9noc4MMUBXStoLJBXE7sbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770akuxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Tue, 23 Dec 2025 14:27:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b8738fb141so1496825385a.0
        for <soc@lists.linux.dev>; Tue, 23 Dec 2025 06:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766500053; x=1767104853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=;
        b=UXyE1z0COZJWMByFVPW43QIVBkgAZ3/0XO+RqFgjwk503ECLxgKow2vK2Ah+XzbRep
         zM3VT7VmtjfhypCq7vDYCEoQZuA2CO3/HCrCMam2nLheetZd96pJPiG8YHO7e0mLWIl6
         /kHxp6uJrcHE5WIx8/C0qDhB7I50Py5SzoJuA3dmeCeX51GgQiEZfGx1U1wtsQi5PRzJ
         bvYhRetbJuOIAsfmSQW0JSIiClj0CO2+vW1pyfErQtW2iA+jLsLoQ9AWC+deJFsjp1vS
         rotjm3BPqhLGbC8LWRR/fxd8/S6e3gKqHIjadVYlgaRfBmG2sJ6dzss7aqQArR7eFDnC
         wDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500053; x=1767104853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=;
        b=ZFTWYW4L6VLTiCHyWU1vqlrTzJACn8wtacJhiMG9rCte6MYhi+oSiB1tqqyAmyhN/7
         CgGyIoO6fY9YnNDcBO7eXcMrsgDcMuM3Akh4SrOTJvj7ZdhdQKcGLDbnB8nrYPK8J7HC
         Zqg8leb8Ig92OL7mHH3nI66taeCMeA274P4To8vD6S937X8Fq9lW9AVqAYj+TCVrR8y3
         NDiewn0zQrE6Wdorjd+S/x+EQAH44WaOnsDx3LGKJpwhAzKTJ3xLXpFiLg7tnbjIqMH7
         Y0x37bNJTmroDnpnpwDc9zgvg6aoLwjnhGYDaCkdyWJTTuQTtxZtTvf7HB7WHIJuMrQN
         xC5w==
X-Forwarded-Encrypted: i=1; AJvYcCXcTkB9kBmKy/1B3UPg0m1CGQgR5fm+/B1/VOR6qJ7ME1UqigbQI/Hh9JgjEdgkC0YpnGo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx72Jua67jlUnkUDsSplmrIwpufuq8DjEA/dPH/4w3CKo0onzEg
	kWpNU6UvwLSrJMU5L9RvECDlg7prZb9fOU18r6xPKw//sDm7mpsPwsSBSCpu0veoNj1WDm0s/IG
	dOPSVgIzeTfrypu7YjCL2JYo73KBHPTsmKX1/NPPel1FZ9b7gbxyH//o=
X-Gm-Gg: AY/fxX7IIAxbZXZFgQItPUnxkgJbw27lRsglTdZBxeQbH89WOvIOw1RI2rHRO78iG2w
	IRNdPVQ/ccdFw8Vv+vQABaq5I4fMXsIkUVqwgsSGut9RgYXBGNiiu6HAuMpIT19rAtxA/6hldaB
	j/gvQ1BYuhMUXYgKlhQoqXmqtJ87wi8eHnxPyzGocHgURJ49I2imfLHBBMrRXYd/coZqAQvIbFg
	OLuH/cbwCEdEvTuq0BJQxooOMJKQ13QfHj0uwxARpDX5lrhiL1/Fw5BL1NZmdftiPnvefqS9PlE
	mW1Z81fNQVNczb9AmEzuMMu2Rqtx35dXDtRNGZDw3huQ5LWE2jvPK/80Mx88hM/pDPetpPbEH3y
	iUXHqHGg0Azz977/Z7vVZpEKprZTcc94NUXxGft1J9llIHKHqzhuTFeiJm3CaS0tHNX0=
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr284385891cf.9.1766500053163;
        Tue, 23 Dec 2025 06:27:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEsw8TOhjv6r9nZIguPFmBTZYdBATYu2f7Bi6Z7slZabfblusoMn6hz2QsbZpBdFgJjMJP/g==
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr284385491cf.9.1766500052737;
        Tue, 23 Dec 2025 06:27:32 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm1436477166b.15.2025.12.23.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:27:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] Documentation/process: maintainer-soc: Mark 'make' as commands
Date: Tue, 23 Dec 2025 15:27:28 +0100
Message-ID: <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8d1DDUBn0OgxirOWILF6DGTSvv73dIacjmoQNFthptY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSqbPfVIHImHavp9Q4pi4X2H2aagN44h5mmn/o
 WUYqpR+7byJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUqmzwAKCRDBN2bmhouD
 15CjD/9zFz8j3C6DgK4c5gqpuqozJOXSLhiVpHrkZwu13cXfBtu687NNnO62sgKoDnmJSgY3jGS
 7TKC1tYhbkXa2y7LlYqwIR9AGqSZYIilY3tQgEm/mNhNNpLjvqlDI2jlM3Dz3RjVcnHhYPB7UmE
 HoH6F9QPAkYYSgKAlVbuO1O5WDuQ71vDzgfAocj/Nblq/wchctMoQYwHqLxQnf2HuhgjhelkVGa
 4QbZr32bHUPLha0Mrvc8blWj0TzC9IQH0lIAFaiHQloC3uBd2WZi6CiiP60R03a/6z4pr1O1Mum
 KW09CGeJWmUBeRJPi5CxXLve+GW74XcABup7kTaA/CehiLucCZ2wDSI+Q1TQBlDNfPH14lex+Gh
 xbyCb5GL2vorCXws3leX07vjVTPmhg5AZUwY7tPDrfSWCmUXqVgDwFkw9+nf1/bsrMlYq8+qQbf
 CJ0erAoMWH3x4mdTe3BkOUM0NArOgSANYZmM8hU/US1BMG/ad0GTixl+miF7Yv3hFcxd7IbSqJN
 Lks7K6Av4LeEyVDddo20QMnTL3ZNUY+zVJcW/xCzVkQhhCmX0tp99b+sC8efuAaCnIUp5irDC1T
 +6e7hPw/o/urn0IscJxfbGpASE0H1uikeIBwotNoyGeghDqqKnr7eCWjEqOk5Iex2ETO+v8Axrg 65fzbZuenE+xZwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExOSBTYWx0ZWRfX1QGuPi336EUQ
 oQzmUrAWoF+bhvFobcZ8cc0TJsBY+nl//7pqPv5B10kIWVbfqIes3Y8EBODY/zGI0x9Flvm3yVe
 /YnIoMwJRF8Gm3Zp2dwHjMVycRAttU0nf89IovfhoE0Ik5/ZlwQHfHxB0FLyEpMuDGuRsIxBEql
 h0QEhPxUX7+igUgrJ5FxdlmD7R3M9CROqwXTCmAOigrJLBpSz2+Neb8QSCHuPc6cuf9Zxay4aEW
 NfIpPc4j8AnFRAFHGp2FOJ1PgJ6yz7qTEyIWBJyG0JprkeDKKIUpKFHgF32yrKX73Ge8Tx3TDp9
 63BNoZvmC4YcWCiwCTNSottat4Y3ldqnVkFgQFsVNklnsfHOzJiavxDqNxAgGmOik1ORNG64nxj
 GmquFW/wgGAt0Ljtn7uQdW199Lq4q/CyAF8CS7GOA5g4MJIkD7sFPQta9Df6i5jzKGgq/RhSzh/
 yLtX0ir8PSVDqOfPtmw==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694aa6d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hP_y0LdtDFoG4kz1LQIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4ilU5y_0epr_0d134uDDvzzBztU00MhF
X-Proofpoint-ORIG-GUID: 4ilU5y_0epr_0d134uDDvzzBztU00MhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230119

Improve readability of the docs by marking 'make dtbs/dtbs_check' as
shell commands.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 014c639022b2..7d6bad989ad8 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -116,9 +116,9 @@ coordinating how the changes get merged through different maintainer trees.
 Usually the branch that includes a driver change will also include the
 corresponding change to the devicetree binding description, to ensure they are
 in fact compatible.  This means that the devicetree branch can end up causing
-warnings in the "make dtbs_check" step.  If a devicetree change depends on
+warnings in the ``make dtbs_check`` step.  If a devicetree change depends on
 missing additions to a header file in include/dt-bindings/, it will fail the
-"make dtbs" step and not get merged.
+``make dtbs`` step and not get merged.
 
 There are multiple ways to deal with this:
 
-- 
2.51.0

