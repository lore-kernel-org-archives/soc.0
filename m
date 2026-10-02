Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4653AAF54
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952708; cv=pass; b=RRXYHn1QVmcAbB7Z5f8S54L2VmruVn6YERxaEkHGRVK2DPHBQUQi0gTyJBERdZno8HTaSqq7uhblHnCcW+gj4lQxIFy3i1M0rRfXSUzEJBiKduIU0Lh80EBfvRXgoCAhh4t5O46intS1RjBHyH+V7HmKULbevnR4WuAC2iWgR3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952708; c=relaxed/simple;
	bh=bgnSLKi4/b9B9GDXumkdyb1pPNDSP+iHt4xwPeofyUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+/1SugIoW6rTAp9gRA/h6CzE0BV9ClQafeaV44OZGa7HHNiYHYxHVlUZsiWh3r2P0yGEZfwUBMZf97pS/nw+sP+RT3Ao/0K0BWgHuZGeRGs1QCc8xbSdt2qVYZ8JuYujiHNxAb2UQwG2w5Qx8aZqeREUg4bsV4LJHusZdHdAUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhBVF+tx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Bq+tC8; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhBVF+tx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Bq+tC8"
Received: by smtp.kernel.org (Postfix)
	id C045F1F00893; Fri,  2 Oct 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790952706;
	b=Cv/18Ovnm1ylYGoo/FYFOCRscQocBBs6s82EUGjiHcY1jhQK+WzITJQ0Wx5OAenOKKis
	 F+1epMtuQ2w3597ETdXHRzJcV5yfT6sK9No6lKnlRXXGNzcZLK+IwZRWZ7MB0RNaI0RIa
	 gTui6uKbqJ5ePG+/K9bZLVGj1Ah3eRCkf3+JTnMGBIA1euAMeZwdooPksvvOtWTJPDAuL
	 D0YadeLIsFmlAmfwzmcVZA4h8l/Qcxnf2u+vTu2szWGeL5yF99E9IvGYn8h9mVm659YHo
	 1aMbZsv3D9wEzjAjPSk0B4RUDUAB0sdg/I4r6mDOr6rL3UZjqHdXQvdp3iYTKq2yTNQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790952706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FLt8/b5szxrO1yE3A4MoAlY9U9dMLfGLJMgXRz2x3bo=;
	b=GiDxLLRi7PPB8MAIchYZ7wP6GjZ50QG8R/Pc6eu2HNJz8cNRp1oUph7ft9XucOAdIR7s
	 aPttZTwlaQ/UVUzRr+AVzM82MCkbzjc0kkva0P86c3w0YvRTFzRmRAZ62PoZY9dJXwpxb
	 sZv4Qa2XL7bFvOpn+YF/WuGd1IUMVmdazKJgpbYOM6xNX3dWZ+KZLRuiwc/k6TxWJW0Nb
	 +dnF9b4zp0bemnRlVRxh2XtSaLKyuqLDqb5cA/KIohKW8EpBM6QQCIUP8o19gzvGCtB6n
	 k/K7JVYaeUG5s26pJUvSvrb+ribe6mRsTjGke7xbFMHTRhoGgfGAGnaXiv84hYyhkNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dhBVF+tx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V6Bq+tC8;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 977FE1F000FF
	for <soc@kernel.org>; Fri,  2 Oct 2026 14:51:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dhBVF+tx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V6Bq+tC8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 977FE1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692D9if0159942
	for <soc@kernel.org>; Fri, 2 Oct 2026 14:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=FLt8/b5szxrO1yE3A4MoAlY9U9dMLfGLJMgXRz2x3bo=; b=dh
	BVF+txcnXqM5jDElFBtSzi3UALKPvG/vqcmvNptixtXuyhF+hAW62m/f1vJJm4md
	R3Og/HyjORcj4rZP5TKm8BljR8g6JHRg6mGo2Os0mcq/32A8W1VcKoovdyaUmfV8
	zb+M8NcHdwhWv4/VvGdHw0VATcUmUAjY3JZz66l3b1DhfLcv0XZNN0pbUUzC1zOi
	o3mIDjIsNea8nx/tl3DtlHQFr/mOmU9bwNkTo7IqCHdiG2qnPFhClYjgGcSLfUxl
	e9HzxMMqaQfC+jmM/yBZGsmWHso1sqNCmWrlh5yF24/J6MzWqYOltB5unAUoF87A
	EBq8dt0Mfbt5KJVSD4bQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxebmbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Fri, 02 Oct 2026 14:51:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806756ea40so5532413241.1
        for <soc@kernel.org>; Fri, 02 Oct 2026 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790952704; x=1791557504; darn=kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLt8/b5szxrO1yE3A4MoAlY9U9dMLfGLJMgXRz2x3bo=;
        b=V6Bq+tC8oRjBUO59WDVc2x6zPTM8Aq2ovaaaMPCeejchFkheggeFBVKWeSuQDR7iAL
         Hgc0k3yJv2708h96TwBCJStqwnVz002q0xrfiW7GR/QkaiUQp0DouQyg+7PCxeM//T14
         kGgHSfxXl6lwXAH7vz+2epzQWg09W8dRvreHlwJkBJK+Tvo4IkvVR0cgBxgF7UzDIJtP
         rYV0KUQXKjgkWUlGLA3eS6iE07b9jg6bw3d1Cw4GrN9Xu8M7PElRdvuTnRjxT1lidsG1
         sJ/LI3AM4snkHvQQH6uSMYNbP3CSTdMCqEDNf39GX7JoA4ZPmlv1E0YLSS04JrJgOvm1
         0iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952704; x=1791557504;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLt8/b5szxrO1yE3A4MoAlY9U9dMLfGLJMgXRz2x3bo=;
        b=I4OlmBzTWZ02c0I06ozhlhog9RYS2g3wUl1q1zPvFoaUxrq8ufOBMsP9osgz4ZdOyB
         G21oo9iTC+vmYfMKoAt1j7nt0Fnwrg9xFS6C6klyR1+n2WI79v49EsnJwnJj/RohliJJ
         8lyUXArQwdpPQg3yfIp183tQlmOpjtpD6gZ5vWycR4tKiyi9hcX1qkmn3WSS8fMzLnS7
         WZXcHq0RKsH923p8Drsh5ozL5DWdiUjxBi+QLWa+PTp9klPSJeTxFlzAdKyH47KC63xN
         pfb9+NCygMPnD52+pA5pjSSwE7/mx37E4LJLXOvyMxO4ZzwDBhy3Tmv5G5paEP4pRAN8
         Hftw==
X-Forwarded-Encrypted: i=1; AKwUvBz18RdQZufHrn4K3GTnieiZMIW7/o5rZD52jyU6GjoyfPQvnx1i1RiYECCUb+RmEGfK6HA=@kernel.org
X-Gm-Message-State: AFq9FYLwBKJtsa5V283sNcMp9ZHwkfCLCgaURo9npH4FRoybJUBOg155
	y07AS13Za+k4KGGdrav6PxmubBtqalTeuB4ioGJLtc0U3AnG1fyUuPAZO3vHqqw7mcXvbOyUz/5
	e5DxB45N4hdzpn072icTV8rxZ0zGHx4cXkaAMWA2/XzF81yAU
X-Gm-Gg: AYBFou1BuyZPIyr7FxN72hBy1u3qGmv33706PTNd8u0zmN7rwRjiW5coHpTuPKpaOHk
	ZglP40mVArYcZG5tOZn57w5nKIaGprmSMUGlwNR4k+ZMFDjxhWjmaGJHrGynVLydaJdUyLHm5M3
	S/874Ur6R34sxVYWr+I46/Tf+CpfTjYH1UpQG+VGLUWv760aMJWDWGKCWZ1mkWt43dRdCQ5jXQR
	WboR4Bbz2CKHb24iZHL/RDG65/syrfMxpLpdQXbmHorbOAFjabDcvRte0jB5WmuM314UrGhx1Td
	EU1Z9jEpuMjnquoVrcGb3lgEohBpzmKTL24H98ZedQkpaPCgtpogZpb0gKG5MGCz1gTlG6gPJvN
	XGvv+UmR+egvvuhfUz6e/0Qvdk6qF/YCxp1Ltx6Q4yZyR8g==
X-Received: by 2002:a05:6102:4407:b0:7b9:fbff:6f9b with SMTP id ada2fe7eead31-7c0f5dab56amr815742137.28.1790952703813;
        Fri, 02 Oct 2026 07:51:43 -0700 (PDT)
X-Received: by 2002:a05:6102:4407:b0:7b9:fbff:6f9b with SMTP id ada2fe7eead31-7c0f5dab56amr815725137.28.1790952703291;
        Fri, 02 Oct 2026 07:51:43 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79d725sm801547e87.46.2026.10.02.07.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:51:42 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:51:40 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE update for v7.4
Message-ID: <20261002145140.GA784348@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfc500 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Uv-ToYxd9aUZ_shOWNkA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 39y4jA4iVv-63zrkmttkGVfLXnBuwmdI
X-Proofpoint-ORIG-GUID: 39y4jA4iVv-63zrkmttkGVfLXnBuwmdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1OSBTYWx0ZWRfX+5EerImH4YGv
 JHYgpwV7J2icI+P7O+SXbVpTgGo6KYiGZAT1+ff/G567mJUIk7a3lIZQWlyMYyd1cC3Ykeb7r1M
 jh3trwb8Ag6TT8G0gRSb6GrRyQ9cx6FThLjhiy9Gjp8mj0U8AQxg7HjcoqzSp8UtfLP8Wn8FlL7
 6Wz2w9JDpTAZ+TrkayjsuG4tNpWxNpxLDWsruOyzudC/NkwyfH3gbnuYd9j3zz6OsvllxDo6lvB
 dvf7VIkeHm5V1MK3hnRqd0mPixKk2ivpjyt+hq8zX+PyRwteheU+SQNl6KSoQHuDERU6kq50x3g
 OYUW/Ri9IlIa9rRbBpufxEeMdhf4bh6wgni2JFnL5KzzRdHerNs4GfiCcuSeWAM9Gi3cPcyxnpJ
 Vl4QFcxrbR+bF7e5ra575mIqHTqJljj+ZUealN50p5E8IsMTxXL1wKasXENn/Ma3UnP2aZ/Bov9
 tkdEkdIOoM23fEFX8Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1OSBTYWx0ZWRfXxfA7fF1ikp4E
 GZSet3oxHBO1j5YhDpK4OyP0m/dvKf2py1QL6IghZGfiNdTECyZ2QaewXc+T6dG8qHxrC1pM0PH
 e2Et51F7hJSA0l7V8IvIPUijGNdxLVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020059

Hello soc maintainers,

Please pull this patch to only build the SMC and FF-A code where supported.
The OP-TEE driver is still only built for Arm, but that will change in a
not too distant future.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-for-v7.4

for you to fetch changes up to ccd4b23398acaf2139cf04f1ba0a66150cbf2663:

  tee: optee: build the Arm-specific code only on Arm (2026-10-02 16:28:41 +0200)

----------------------------------------------------------------
Build the OP-TEE driver's SMC and FF-A code only where supported

----------------------------------------------------------------
Marouene Boubakri (1):
      tee: optee: build the Arm-specific code only on Arm

 drivers/tee/optee/Kconfig         |  1 +
 drivers/tee/optee/Makefile        |  4 ++--
 drivers/tee/optee/ffa_abi.c       |  8 ++------
 drivers/tee/optee/notif.c         |  1 -
 drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++++++++++-
 5 files changed, 43 insertions(+), 10 deletions(-)
