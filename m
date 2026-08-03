Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B20384CEB
	for <soc@lists.linux.dev>; Mon,  3 Aug 2026 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748673; cv=none; b=MGzB+klI803Y43zS0hQvxKoQvSXp3M+VaWJWc2oC1ox5qfHYq4kIT99PKPrGRGtKeFbAg6HLPY7y6Gre3OsFKTzHJpk1uHt3iO9JjEjlk5CyNBmJo8etF3K1zjehEceUFyPyYXg1iQOnirozWoNDAqCHlh3Z3EW8joCFNXN/0DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748673; c=relaxed/simple;
	bh=7tObqCPMzjUbkFLV5jV01Q6RuX4OHirNpsj++DKUtOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RdMmQ4WKk6psdhZi/KOOS/wmGS8M1MNKOkT1CXjd0LbX7FeD9y7j2aDSsDKNaYKZ5PHiedZ62ybDiWI8QGI3XyAiOdnq5cljQmpwSn02RB0sYws+mIoiYsoQP680h2Zm1DBBihKe71ddKTbWK7a1i0tr+fnuDq/ZHLgflx1b4es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhVGF0X6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKIrFZ7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhVGF0X6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKIrFZ7q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SkNc3759066
	for <soc@lists.linux.dev>; Mon, 3 Aug 2026 09:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5m
	TjxTvHaQ=; b=PhVGF0X6zlYiODI5cQ+Yw9/piNp0eZ+laGtU1A+lvmoq7VkLvv0
	yLNamzN1ujbd/fbIkIGWEd2Ph8D/6GiA6D7Fuxi+yJDzYQA/ihk4q+rxlnYkwFLn
	Smj/qOpcCcuWGqgOH3VlzdLJhwglgVXuFBm2RrBZaNF7n2qqyILRsASLQB9De74I
	fFnU0ydJOKBgCITV8Xac50J7uRBkuaz3dXTWerIXiYtj9ktZveRgCm5mq3SQDy/t
	0YyBp7EaK0GRkDc/SLcTFcLa9QipawJ2iLxHEMZ1r1W02wJ41wY5eJvz5TWZ+MIa
	bzUQL39muhEmBeMTtIMXRo4UxEGWIkLFvbw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrnrr3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Mon, 03 Aug 2026 09:17:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9489f62bfso34505606d6.2
        for <soc@lists.linux.dev>; Mon, 03 Aug 2026 02:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748669; x=1786353469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5mTjxTvHaQ=;
        b=jKIrFZ7qJIv88/W2PHz5p3/tIjfZ1LaARiNb1bpTWkshjCYJO6ri2vv6W+WKG4Hgi7
         L4JOEeeoIFSZMfFTr0ILmnfCMr99tsefqxHGd6sbIg7+UE3+JcUa1xcOpNb0tMcfVFaF
         JZnzenGqUUcFvz89DKbxtnPRb2hUi7tpVXmn2AZ1DJimz9nxBzx3W3Tcl6wZeZBBoHyw
         B/WdIID8D+2tzQhkpgqDSUqdjf+Fhk6IM90tsJDw5niq6L5m8h8f3BX3P76bHOsqFmgO
         uDaC4dxkPqH4eiMMO3yIfpMzu6Af8fBJCLf5P4ywIwywOuMN8HNm7PzSoLSHDFD5k2Lb
         dzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748669; x=1786353469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5mTjxTvHaQ=;
        b=Q7snEWFtM3jfok4y/d4N6KgOv/PcDSA1Mvza0ymmyW4HQji2NxzCN2FKXCro4L/eZf
         sw40v1sGVAW0e4mzLZFProoBuZ9mQ8npgOY6ReHTAgyU/J7iswyQcYjVvuIHqE+OeSn7
         QujKLu3Ceq/By4/t7vbSoQSnMzyHYeN3db59pGoJKCvNWRZapJzE3TL3oqTg119bbkDL
         +Yymn9qeMLbArpEodD7itbSet7/VS2nyuKvS0BGPw5KkKukX4oAKFKzumMAxe8e/y7yy
         YfC37ScFXushSZQVW7Rklt+S5NywYXx0rGHCMktu8eNc7YmrAeIP8SGA5VES0uyNmOfN
         2l7A==
X-Forwarded-Encrypted: i=1; AHgh+RqNJVP3tigzXlAPzKPzNDyW8QKbf1taRYsUtOUz5HZNdXaQawiYh4HRRfx5jVihMqb9O1k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHd9Eu+bDtl+5Py1vcmX2ickPA3hkhGG2DvW2JIYjnOPPGLHeh
	xDRe4yCOTOmjeYK5GSSAr2Efl+lGqoh6K0D/MOd/ajghb9j9Njv3A8V94emZPtuhysceL4XeiJn
	OESeqycvTVtKVgZsZYi2EhHJ3RC6GUsi2wdywxOc+x6Mg+ScQbJV10uA=
X-Gm-Gg: AR+sD11ymNkcuc6b8yIAiuxGo0Ih8VuFxR7y4Tec0foEVjLIdj3uyFuxTIo0oL/x8Xt
	z/cmPmdZ9Bp8qfWX9jdn+5+Z9zgApvUvlabFlptq5jghelFnTgLAp3Qv9YWsDGja7I8aVTvA5Lq
	Z+u3jRH65Dc32bvtHkLmJzGECh13oM2IAL2HbhIw8qghyZT/HT7HzWLBOSn8r9ck6tslOulusEt
	vaUkTvdx37LQMn+nfyKlOv5rygxzdgp9+4XgW6tSrYEsdwXFyLzc3+8/HANDRa6bNHhF73Yc4xL
	bvZKwUzzKY2yy5jDfacH0PVQBIgSzoY9SzPG0RGC3mAGPb4YX1Vb3DlJAo2RJmZmCq4PFY6RWxa
	ldSNsxxS1MWot0jNb
X-Received: by 2002:a05:622a:1214:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52b56777af4mr169109331cf.27.1785748669224;
        Mon, 03 Aug 2026 02:17:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1214:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52b56777af4mr169109061cf.27.1785748668765;
        Mon, 03 Aug 2026 02:17:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2961sm34636955f8f.13.2026.08.03.02.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:17:47 -0700 (PDT)
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
Subject: [PATCH] Documentation/process: maintainer-soc: Mention expectation about dt-check-style
Date: Mon,  3 Aug 2026 11:17:41 +0200
Message-ID: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7tObqCPMzjUbkFLV5jV01Q6RuX4OHirNpsj++DKUtOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFy0UG+dPkodNTdXFRBRzXijTLDSiofm3qvCm
 +CC05n7edSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBctAAKCRDBN2bmhouD
 13VSEACWf5BxgM1MPzs3SLlZHSkBJOO1mrOcICYXTCj2UBu25FpFzZJ0cQuyRYs6c3ytPFXBJz+
 mKqQuylHd9dTGFMgCBnoR2Wdp9/RDRAXpMwPWQoOmVBFZPThU5RX/v2wbK8Ax/441CzZaxD4eRa
 1FhFuSYhdJlbeI3BqMplkaqIwbFOtgrmJY5HOIJHTQCLRplxG7YEydQ3zEJoo0h5Xp/ruyjgShc
 mjf19HoLI2h3OCOZROvwvwRSQ4OTZ7JF8A7Tk7DYSl45um/jgQn4F4db3TriryvKSSzx28eQZzS
 x2Z7s+gT6yQqHKyoTHyv4Thn2Lfb8yYrK/1QpPFqhBLT42BiBk+GI9mdvBzLrU3K9xidHDUjAn4
 cUA0tD+F/HIZBvy/pLrfLE8XGBk0XYDIeUs7XA5P2Stt3QLya1dy51hQrlPdTTeYMg0wA9BqAHr
 jkFGS4GPtV/MI7HszORjyfzI2umXiFrbiZaPdxhf2UefXZKLpyl6OM9IdVjoBb5F1pVoV+oH3yG
 fv3ViAdfvdRIctv+8YP5lkh8a9soJ1Ldhm8kgmLVLondNx58adtJnzLiF5LkQQkr6nT7p9i+Wot
 d/LQrAzycObnbm8QF1mo7pnUjXGy2cf7XokenDiNfEAjhE5W8LYIOup053kyWm/D6xrWEhNIQng MBlArMunvGyhdew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MiBTYWx0ZWRfX4Yk2qLoNilvX
 G7KgT1zZlQVKEriCW8YfZk42JDIOrzbfF3C3YlpgTQ2iCmQH+a9ObzWCLHnfRq/0pkhQ+0UJPpl
 llvyuxxO4L1JeZzylcvm9By9zrKCsSM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MiBTYWx0ZWRfX4Wx1/qsQEmPW
 TTAw6HgBdp+pXk1czg8J3Kxu3u1o0dHltAyhdSL/SdtB+U21JvquA6zehGtfqYJ5ZVv6M3lqtjX
 Y1DSw9icYBF1vHQ7QNCa8qU0lsdNRpFlV3lO1uYH1nAwsBdoTZkxTfDE/cLitEq1R0vPfjkg616
 Pafd/eVNYokIh3gAkxG32Niree18RxYNZc+m5yUvJ2yEDdTqL06fLJewz1NBgl/a73Byafqwee6
 8a058A4HNzTsD+K8F1EwJVttS2rMoCyqxZ+CKgMj5cAhCvlm3rxS2foqYsvSZ51zPpt3HDpXqMa
 qRIDCQQYRnymNOVeFJ+l/nktxfPiPNF/vvF8njTSBIaTXpmPzOuzduEQ/DGcXbBp9EqL0Y805zY
 1rOchy05d+ZbH2lJ8Ka0vwh4PoXTtYYphfUJVZBzR4/JCtwG5YrIBxrq7IlC/TAnfsHxdECHGUy
 qNasUvCwbZJeJp3BKrQ==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a705cbe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gSc81ffI4h0EHLWcGl4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: JdNxG9oEF7Upj4oFPVPYCrkXs6bhvtfr
X-Proofpoint-ORIG-GUID: JdNxG9oEF7Upj4oFPVPYCrkXs6bhvtfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030082

Any new DTS code should pass dt-check-style 'relaxed' mode without
warnings and should have addressed most of applicable 'strict' mode
ones.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index fa91dfc53783..96a87794583b 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -170,6 +170,10 @@ For new platforms, or additions to existing ones, ``make dtbs_check`` should not
 add any new warnings.  For RISC-V and Samsung SoC, ``make dtbs_check W=1`` is
 required to not add any new warnings.
 
+Additionally new code must not have any scripts/dtc/dt-check-style warnings in
+'relaxed' mode and should have addressed most of the warnings in 'strict' mode
+(the latter mode might produce false positives).
+
 Branches and Pull Requests
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.53.0

