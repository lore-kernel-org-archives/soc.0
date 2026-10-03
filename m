Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F43438466
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038796; cv=pass; b=TdoKVKJGQIFlXNzKEm1JJyXTZ/EXBSTAGNcMHaLkYt5g/AqF0pVkhM6MAK3XsT37979YcR+esP6+A+nxHE/7hj1QVleT4s0mK2fYJ5bE8gF3LpdSMQWBhl7lH3fuKSJNpPIQVEFKkPpnHf6ZQQGR2SyrIa06EPsmaaEn0ebyKwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038796; c=relaxed/simple;
	bh=2XBTFN/ZW2XUHbigsiwRo3I5RiyJZNdRNr4QzxwJPOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRdD+H8JUsEczoGJ8l0iLx4I5GKpdelmkdONsnIJnmLUsMOxFCPS2LEdRJzmxJaXbmQchxZkqM8VcSHVz1QYgmWxmEvM7yUwR9iXP4cImn3KaEybPJyQ2V0RGBkdgl9AI3LSrqVRtf20YclmRXr8gJ/mNsk/S+bIQ3/KXCjG4v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfiQFcWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JD5m0RfD; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfiQFcWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JD5m0RfD"
Received: by smtp.kernel.org (Postfix)
	id BE9461F0089B; Sat,  3 Oct 2026 14:46:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791038794;
	b=ovXWMIrRgngE1os78c+46Egxu+BdOfQ7KnfmHdIL1BMKJI8ZtC3IUmCqeKhe24MQvEhE
	 z8b7+cJjrh+6RQGVb3ZJzrf9uU/Zf4qKgd91WeFtelQyuX9JUFifngsLxlj/gPfSoLZrA
	 qLapTrlbfri/Xsc3akIhp9Kjo7nQCzuAnqgNfCN9/mHE3glA5oRvgYtjOzMrMYir+YRj3
	 Qmyf+1IfspjD+rRmY/w9HPgihzxEpbovSJZhWpDrtoxHiYnYgJfg6o/hhNIbnDMdyLhOs
	 OLtV2IZZdk/xTOqYtOhJIonGReX2P92CtCM5W4gAZVHaKPjcBZ/jrLHzGursuBgTwRg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791038794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VjaXgIsxT1sF1UV+SMF8/q7IXyRGZSgNOM68gfsjAhY=;
	b=xOpt+PYnbbuDwGTq1+fJAubuTfd1nAyskzCjDGaieobIl1BtjA9h3+ib5I7SPOfKPC+m
	 SwsMmCdHt2SnRVR+8BidOE4BVGw7K0npFaqCcRr4NRXy78YHdUx9pww2ktMRyLtvYvLVa
	 L0AVXEZi00cgXCx0Q9lm5cEmB8/sNrYNoInEXJEEsTBGo4EK+FJC4UfJO0YEngxz5PFRU
	 tpPzOer6OdDml0SgpPggPSaCb5+zKQpZ9JFiytkvW0RjXUt0bc8r3j4Xnz9M9EBxrf/yi
	 aUwKQZf8LKNlyj4Tyqqem0ToRZqILIX+eeFJszl+qhCsuDl631317djV2c/DgWZuSRw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OfiQFcWL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JD5m0RfD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28A051F0089C
	for <soc@kernel.org>; Sat,  3 Oct 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OfiQFcWL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JD5m0RfD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 28A051F0089C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E62224053825
	for <soc@kernel.org>; Sat, 3 Oct 2026 14:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=VjaXgIsxT1sF1UV+SMF8/q7IXyRGZSgNOM68gfsjAhY=; b=Of
	iQFcWLnRsurql/zV0MuZ2BPSKaG0LKMvqdDDOtLtTV8HKjQruwHBiJH3YtzxX7hH
	eiYTOM/m9GQ7BzKNwHVhxmksfUn6zbSImpSiRQzB4WRKM/0COAIEbYFgPL1UxZN2
	NLxHRZvicZ17Ohe/GekohiEWIroo3p1PxPSZF8Zh2Rev38k0yeQ+LMuyvKzweT/m
	vaqnHjgAcwmjutxyLVEOVGUe1q2RIJLGQxlYusjowQ/Mj1mt6w/vLIdyx/QUYJgy
	k8a6qUo5LWTiQzmymvkfxHojapeMBWk43CulN9BxgyZRI9KINQATqlhDu9moPKR9
	BR7QXHrZhJ7XOcnOOBxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tfd94fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Sat, 03 Oct 2026 14:46:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so96776685a.2
        for <soc@kernel.org>; Sat, 03 Oct 2026 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791038792; x=1791643592; darn=kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjaXgIsxT1sF1UV+SMF8/q7IXyRGZSgNOM68gfsjAhY=;
        b=JD5m0RfDPKqXgIx2ZKk22g+/jr5SwNF+LgJVBdFVXEudFUZZKf5hal11ugPnpw/WJs
         85EiVbSJj46mnS6aiDoPRpH68W36FMTEEsZ74ZdrHm+aHZglbIMyv6tJhejGMsFACAwn
         irOnATg80svzIlaAz8/3QgXarCd/QnUnYAu4YhRD6SSabYegFovpLe0Zeap8PqrBl8Lz
         do24jdb8bCq1VFNwe+bTg4ZaN+hrys2cAP7txL6OZnAaxjDorplEj7YjWRdHHY4Vnao7
         mSeXjAbJ+RsS7/Ycvi0FHcA8EGjWXO9JEUwKH78DexgiO9yNtl8CPF8u4NiC8eQ4vlyn
         CfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791038792; x=1791643592;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjaXgIsxT1sF1UV+SMF8/q7IXyRGZSgNOM68gfsjAhY=;
        b=HiNuJRcagoGE1ATFVR2e/a3Qhp1QsJU70PjtbkC9O1I3o4UeJvK3D/b9+4aBj9bs3j
         5SXhwoxVPfR6VzuboUVyxkSqhdvBiO7LmLUMoO4JDoFzMof0yDxLZ+70WwsqKXGYXJlS
         MrSNs8pEEDDEZ1uAC12HZsXZDpFIs2LICkXrrU6aMDEHbcZpnnipUX46H2qEPGCzQEmH
         RM4phsHNrxJjqCZXtML65yVZXW3o2cyHlhpzvJSqzyEbQcTUYFt1BxccQ8EjGtsoqE6P
         WznhZXSrADq4CS83F2Xo9Eq1NqG8pAazVrM3OvZQdkT1hZFrw8PAXKpW/6vQEB99MLV6
         hKTA==
X-Forwarded-Encrypted: i=1; AKwUvBwrNvALg75pLv+7xGiZda1+dRbyKvyQvyEmL+9CrmCVNc8h0wp+csr/5lvZ5ZH2t76z1oI=@kernel.org
X-Gm-Message-State: AFuF++nvwjsZGOPdZI9ceHd20hok+TjPjN+GOD3F2Ej87h6R8mc2VCGz
	e9dT9xgB+rj6GQKkwm4AtNGmxxxiUGqhQ9aL4tQ7BY8CZ7+CXOAsx58i1+Tj+PTjHwXcJVB9fbP
	EWdTojZVNGNn/gBD5trB0hZ4CapbKxQMx+TtsBfjcKHqqBSdx
X-Gm-Gg: AYBFou1bPvaifc8r5OAKDDi6/v8NVirBxOu+uiHk83eAdB1hg+6wIIJyxC6sy3bGp+A
	Hj4p3ODFKfo06wYlb44dDUFfSkyVrFwnKrq6vmNGFQ4Tf387VgCva15hMDW8oMV5e+Kdxvgf7Z4
	xNYXRwXKZeS1xXCvMG9bq7OK05vSUKuOeZZqaFq9BiG+/B9YY3gWWQ1IozgakgXtNTIqp7pTXFp
	JFA9Cwea4oc/U34WP0dzPxi4e92CPj4MX16c3mLFy8wBhkC5UC/qeilr0GIQQXl30dkWwSJSgmi
	IRLDHIvPU3YKvnWvFGafTYiG6lrCtRtvbqwt90XZLkO0Ud+459BLzIrtwpOzuKjaf60VAsFnRH6
	EhcZxmOeBnRqiynaFg0csJdYzNl4w9NF7YBdf0k0p6LJz9g==
X-Received: by 2002:a05:620a:404e:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-93e510c3e52mr529041885a.61.1791038792206;
        Sat, 03 Oct 2026 07:46:32 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-93e510c3e52mr529037585a.61.1791038791630;
        Sat, 03 Oct 2026 07:46:31 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd0568esm206959266b.13.2026.10.03.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:46:30 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:46:29 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fix for v7.3
Message-ID: <20261003144629.GA929824@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Authority-Analysis: v=2.4 cv=LroHWXdc c=1 sm=1 tr=0 ts=6ac11549 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=eEE4H-7Ojt4y9GLAZT0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hwVCtsUplLq0Yvbk1HQmIqnncnwZo1g_
X-Proofpoint-ORIG-GUID: hwVCtsUplLq0Yvbk1HQmIqnncnwZo1g_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1OCBTYWx0ZWRfX0sKEhc0JuGkB
 clGiHpMUKm3fpxKpNRSO+JBsMFs/cuSMXcGHYFKkV+Pr2Wm8yQ5o7n3NGNSAjraZPKpcrCnz2AY
 P+Eq7ops5CEOmPxb+LmsLKE6GFVNg+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1OCBTYWx0ZWRfX18PYvhLH7BlN
 9tZ5PWV5htq2oao7YK2hy5Ucs7iLShmTHyqRxnBVh5+caIusM+KrMZMEssTpCph5keEdj5TosVH
 4No/m7Os3UdiAWkMFTeNcCXIC7ONcr9ATt/REWwCI0HybyL4Y5DaVFHyW4lfCz9t7Swcc0uyOdM
 dUVLN6Dd8MdFkPz+6GlVNAHZSGOUKDG01vNPHLze3+/FOME214zHrvwvNnKZEpJeBC9WmxZeu16
 OG8zJbxmStg+OFduVdmoibpeKxS05Ys2S4W8Hptg1HjY3ETquusmM/4RqlNONQrXxaG6lEwVxYh
 Jh8OR/J2RrBbe5qaa6E56KaNDVOmuOX0QXdPlr5uBNey4FFYf3o7hmXbh/QY5et8/fBgKXuGTud
 TzVEoUkNmttxiUjzmwp3NZvuiqT4m05PRRvthVUFsozZx+RblNvxmE+lEDWgkKSAW2UD++o53k+
 UYcqBpGMXUwgZQ3UsVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030058

Hello soc maintainers,

Please pull this small fix for the TEE subsystem. I've only had the patch
in linux-next for a day, but it has passed my local smoke tests.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fix-for-v7.3

for you to fetch changes up to b7f925fd5226deb953c8dcdc9677d3fcc2717c00:

  tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper() (2026-10-02 13:58:48 +0200)

----------------------------------------------------------------
Reject zero-sized allocations in tee_dyn_shm_alloc_helper()

----------------------------------------------------------------
Georgiy Osokin (1):
      tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper()

 drivers/tee/tee_shm.c | 4 ++++
 1 file changed, 4 insertions(+)
