Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793599759;
	b=EVqLIjOo2oEoP/+OODF2KYxLMISrnxoRBO48CdA0fNRFxG76bVfUsrzcH3G28B14Jamc
	 3TbVX5rEZfV8ooADsNm0iuHhu0H4QEH68HZ9IcsdtLrUgW9UxOWWBMKxeDJTPFDoIweXX
	 Tz+LvIQw+dXseqo+93yT+Gs+RKxeoV7Hzao3g1G1ft/NXB/1/BnZecb1+6/yh0Jgc9rBk
	 v6tXQ3177NWQRs8N9yZuuUfhkhbKQWSOUbcX9bMkAhvzAxNT+qRHdZoFtG3nlZEpt02Eg
	 lLpyuTggrm7d1/EXFtQsmBjnUNajBqGRXQr/RSxqvA5emjdJlJWChibsJTMvoLcVmFg==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599759;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
	b=3ZgHFbTZ9y8j7kg275WWCyNJs3O2JbLGsQaaeKo37cqiFnCd5+lXI/hpUyjoDPd68Kor
	 n6veQ60ui5WxPTzEZHhNWXmIM+1n2QMuRzIklI82a3+mOV851MD6U9MrsTIZb9diQyKxl
	 +rhBOQRapSC67u/qh/6v4HIH5X+SUDd+msCtM2cAgSHQY8ZJbiah13Np/Zessxsag8En4
	 2UTTh2+jju99Pxeb1VeM78v63HUf2FpzWLLnwSTvEZ+C0T4zFhhkd/o5Rs0R6/k4vFgKX
	 Mt1tlOl/lMSYuaVpuqHwwS+1YSpGV2TmdzpqP425LnkzxQkTyvCPeFxRkfSz3wEqOkA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF160nBl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I54sWspx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581F606A32D
	for <soc@lists.linux.dev>; Mon,  2 Nov 2026 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF160nBl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I54sWspx
Received: by smtp.kernel.org (Postfix)
	id AB9101F00A02; Mon,  2 Nov 2026 06:09:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793599758;
	b=UwHXBP6Pl0nIw7iTqRGEfbDpbf3R05gzg9bXbLjyQ2QaW8xNbNtcWlh4qr/SioMMvZ/m
	 Xst+hvYO7ouTdsvY5kGFYdpD1dApuDzrHcRdjsVD3arkD41AP+j0fsk8DnlNeuXK3rlk3
	 g8mmIgowBgrDi/Od+E4QRFvbYQdnm3nTuSvwU8Iq7EhTPte79ctPwRzJuk0IuPwEDCioW
	 L90NTbXMAEARNazEC65o1F4u/UmaC7S2MgZLIFlfGRT8qNkitXu8lz/NXpvxr38UTz7do
	 Z7KF+eB5SgJg7Z7ZLtsL8q59t28m3RkJzdxYbrOr90j9VTDmB6VIfsJe2uOlh65DuNQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793599758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
	b=yQUX4uAmGOAoS/D+Xeryw9XLJpRu0+p9y1wYLfydVQag7Cj92NgPx5PurvTK2weY0qsa
	 xP/yu2YjYclkA/p96UhC11v8mSUTZSYHDuA9qRffxYjrM1f/+DrUQ8fpCPNJmrg4B6hlL
	 0wFKn4oGxby8domefnydzIO+GqzYp9lR110MMsIl/PuA4D+1Wnxn9SXbcyJ2gzVOvXYfj
	 8oQpJcK80J0mAY1De7irEMsgWFlNOvMM1QWj9xmouwx9GTZqpwubIktm/fJW++zcm20ig
	 yAPlR2LEHxCH5zHDIrcyfvd/cHT9ntJak+UIMHlWu91lR/fw/O7fITMjqPz1SnuKBRg==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF160nBl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I54sWspx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7D8E1F000C1
	for <soc@kernel.org>; Mon,  2 Nov 2026 06:09:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZF160nBl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I54sWspx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E7D8E1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24wBTA1262327
	for <soc@kernel.org>; Mon, 2 Nov 2026 06:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=; b=ZF160nBls992pB7m
	oVZcOD1SOxpQ4fAPh5X3Ns3oYFTa77lximGLGfvjk4rT/SCSPZ4EBKOH7E0V7Ixh
	mo+O/qdY61Vak3aFHJRg+rqqXnJaI9c0uaPp7wqKbd4Lwmekr0uTT3KMRgQfy3FY
	b2fkBZJ+E402ahWYQJzC9ERlJEps/o6GdPi7CbligQJjgLofmWGjzLSZMJOsZl1L
	7I0+mj9lUV7A8cHm5IpEp0cTgYokMaMx8hxSNjiFPlOrCqbgK57fuiqrCdClvHDH
	qhveVHJLEN8J7ks0gLe2rzaC7v4MqLahUQd83ZSbk/Bq8ZtQUNX+70e0bKpjBqdU
	n1qbJA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4g6m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Mon, 02 Nov 2026 06:09:17 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0cd41e7aaso38632617b3.3
        for <soc@kernel.org>; Sun, 01 Nov 2026 22:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793599756; cv=none;
        d=google.com; s=arc-20260327;
        b=ZHPJBdv8duVMIKwM9djJvP2T1EElmhRs0mcmHJ7MYtNXLj+ZYiCFpewpdQQFU3Zf8Q
         vRh57UBRnMriba7X9b1a8KC1mahu18OTPczYVZc7ufExM/bhMVsJ3Jahqk8tOdmPd7y+
         M7Ha0r03RYxtzSPYIPNjrdTLcsmXTfb7VJmhF4BaOpuc555X1D3BOeqDhEFkHY3vLw52
         Iqoz+1ighTg5J2rQ+Q6GZBOqTOErCG0J3I36dd6AfM8VpYOdSzmkfr4+JvIotoxXXVjI
         3Xc0JRw/b6/pJwWCi6lIa7CrQrPitkajZQCxNIdVMD6e2f8b+wtyTEK+vka8p0DSkGki
         RI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        fh=HR1CjUbuA7KTmKO5BjVyAkaGy8zHmiP5h6tf1ObVJJM=;
        b=bJoNAGi+6X3dxSlq5hQtQDAHnuVXef6BC/CJdQ69Jbzz1m+rZLKIkZSzPrnN6E070G
         7LCfQeQB3qaV4PnxOE/oOnDxPAUc88I16UsLGBllSKxcrJiBWgo7gnjbfZL8e5DJmwxd
         5vGOdfI4jMGs3g5QUOucW954xkGedu8YN5QvMb/qUYiVQWQ0p9sczCx7NTyo15gIJeoQ
         eIuWYRc3nc1smirLw8eAgRfjZdTt6ud8lpglYW7F849CSM4bMWOxl0e50ZzspfbN2GRj
         1chCKArYLKlFMPk+T7PUy/vA895N7mpPNI5pPvhmMq8djsW0Ou0mJPctQHukfow3O3UY
         SbwQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793599756; x=1794204556; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        b=I54sWspxld55nlJ/jEyGpO1hOIeSHoN/31Di0RDf6RjsxZMwNxddJBBz5QA2lInfCR
         2ASgKR+Qkxf1Iko4Fdc9CQFUI4x5rwtBsPQMKbtCzkX2lt4P9AZ3kDSfUWYuZsqljPy7
         baqBxLfdHGU/qV/wU+tYwqqoAEXLudWiKyK66OLBM6QhNJbYRwNfhquRDAOH114hIzFS
         rBe5/cOkRfPMviXifCGJi6k2lC0tsYVrHE8wu2VnshGIQDKOj/cCPgWMMCJGK75ioncd
         FecJu7E/nB3QZPMO1/UQDq9d5NqCtfMKvmT3W4Te3FBGaC9kr9UWI5J0/WCQX5JDVag6
         L8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599756; x=1794204556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zueH4EHn/lD7l9x2yjdaQYpbQCvXUU5hvsdEAPTBPQI=;
        b=nQmHpK7LIePVEPzrMh2qUHoJfLvScDyVjm9QoMkkKQ01684U9VE5aJDk0uTqQ0T7W3
         pTnNIdbotOPgp1XwGRuVWJTy1sGSPoUmme84TtIOGbjs+katJ/3Zs8MwRb/16VQ6yDlL
         dLfSqJdEoJcHE4IV+X0f0YtscaBvF0JqNt27AiJW80gvwz1KjYTnogd3CeWl858AbFY4
         CfWGwCl5oaAYxcjN6xvei4FFLk9NjxNDZkj8EIH8M3gYwSn7EZ6B1Ajbx5617TVUFNa2
         vFSyWLbI37LKZE5yAw8F5cSeY6UY4BFE6cZMm8s3EmrEE0nuK7P6IRL0tecY5RkZPmya
         Jn3w==
X-Forwarded-Encrypted: i=1; AKwUvBxX+CSz3QeBd7T1HeJMp+lbSHINX4SBCFGdIrpQrE5AbJojRgpLjmOXKbX+wOCl+QvM6YY=@kernel.org
X-Gm-Message-State: APuU4Z+PwVvi189RomuSuD1f1oqRybFMhU8EPuBoyjqTEbU/Rtbf3dSX
	WgT77hmigmDe//SISbyxRl9cINV8LQBiVNjEJkYZJtsnZwKJCtKJs0OWlYa9OdiJo0uE34OON6y
	sL3pZGzgS8JGUsDR7GePqBlTiJNOurLulhQ4FOH74Xsksd/yv0wZtVbOodis/Wg3lO3fHBvx0Ft
	dfatCZJXj/jSMo+pE/sGIYqt4=
X-Gm-Gg: AYBFou0dGrdPAwUQWDUP1uOHnJNaDmiVXhwYk2tNlp7MKxEmDW+mHv9hZyWBHx4F//K
	2zoQftFRFDxT2VvNhDVbv4J7DNM9wpf6bO8CPQpo6zmhnzK1Li2aJ2OuR7JHHy9cnVj90i5Dbdr
	zzs9hKinGpUy5anYEv+iPGdUsznT5NiykzZ6Nv1oPBqCI5Q0+QGNM3tey7Xw==
X-Received: by 2002:a05:690e:4594:10b0:673:e272:f3f8 with SMTP id 956f58d0204a3-67ba4c89334mr3369650d50.20.1793599756055;
        Sun, 01 Nov 2026 22:09:16 -0800 (PST)
X-Received: by 2002:a05:690e:4594:10b0:673:e272:f3f8 with SMTP id
 956f58d0204a3-67ba4c89334mr3369635d50.20.1793599755206; Sun, 01 Nov 2026
 22:09:15 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260922130653.357615-1-andersson@kernel.org> <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
 <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
In-Reply-To: <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:39:04 +0530
X-Gm-Features: AclHuK_ZGfEtpfZA1498jVLU3PJS-3rP5e-VPIRkigYGxV0PkiHkLUhpOvX20yI
Message-ID: <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: VoRVkTMxPghkioR3Pd8tCE3SYlEY7bVj
X-Proofpoint-GUID: VoRVkTMxPghkioR3Pd8tCE3SYlEY7bVj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXyggTRCu+yZAi
 CjgObdSnuoXg9wy3pBma3vgaPaeowfc5Ms68AgTBbwmL4q31W48HASMoRFkuJubR7woivlPPxA6
 2si642hMU9A3WikqVU/v88XNBXTG5lk=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8290d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=kdkvEyMxHJgC4A9uITsA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfX7aDlIlr8FuIj
 IXXS5Pzx4naj1WoB29scEZ6g3/Acoc5OzpdriPH7OpeS+IvN9UdJ4YuZ+16Zx32WuPSIk/jC2AF
 BBVmRiM7qCbw6X5uY2/V9/LbJBe5UK6ggioanWVsetp/E+Q3nI2okOvKP4tujNPvRNmcdmx9vAe
 SUOf9PDTBqwU+2nf+w87P0VQmBWScVABRF03yaqdwPfSRxEvwQkb2JQerGYv4bhRneGQcg9sbKX
 I+Hhw2hVqSbBLXLr0n1GAndfDjjO1ZejBBPYJ8dq7mF2HlOqnFj4Rg2Ng+9oD46EV/rZRux+RUw
 8tZcZqOBEX6msp3VlmWxBBMk8ClcZqkcFTPjXU5ZYBbiqpiFHMG6ZA0zm3MKi8gVemQ1+u2E0vd
 m7SLgVXvV9iC+iVVOHBLdNGJVRUBwxvDUrA2lNMkt2LaZPwSiW7Yz2CH1yX/piWdCu9kWQbnubz
 IosM3aP+4at5diemNbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020024

Hey Bjorn,

On Thu, Oct 8, 2026 at 10:35=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hi Arnd,
>
> Coming back to work today after vacation.
>
> On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> >
> > On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > > The following changes since commit cee9395acd8043be0644b25c34bfa86623=
f2b935:
> > > ----------------------------------------------------------------
> > > Qualcomm driver fixes for v7.3
> > >
> > > All clients was migrated from the Qualcomm SCM PAS API to the Qualcom=
m
> > > PAS API in v7.3, remove the now unused direct API.
> > >
> > > ----------------------------------------------------------------
> > > Sumit Garg (1):
> > >       firmware: qcom_scm: Remove SCM PAS wrappers
> >
> > Hi Bjorn and Sumit,
> >
> > I was running a little behind on the fixes merges, sorry about that.
> >
> > As it's getting a little late for 7.3, I would suggest skipping this
> > one patch as it is a bit large and is a cleanup rather than a fix.
> >
> > I would instead merge this directly for 7.4 but still take the other
> > ones for 7.3. Let me know if there is some reason I missed why this
> > needs to be in 7.3 after all.
>
> I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
> to keep the dependencies sorted.

Looks like we were also not able to land this cleanup patch in v7.4-rc1:

firmware: qcom_scm: Remove SCM PAS wrappers

Would you be able to merge it for the v7.4-rc2 at-least? This is just
causing issues with patches being developed on top.

-Sumit
