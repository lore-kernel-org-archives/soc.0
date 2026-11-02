Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793601811;
	b=FHZlze+KHa7exf0sfXsVvTF79mlQBv943onpyeKNwYtY8qI70s+rXJ2B+jY3+CzMs0bQ
	 s8hBjxV6o3PKzUAR56lbnnXKkXsjtEvSHH5JsSSY5Ml4+Pnkhwn9jqNcUrZNUoJEUhIsH
	 /uXzjcd419VSzLQhWsNBtaqWzWyoKl/ZUB5o4/jmyOMrv8kHnkNMeY31DOQIzCqWoY/nu
	 kdDBEbaF4yLmgTsbkwHHXAhH24o2N0iy61fWfBTviW4LsPYK048XyP1x9xRIw317hqSrT
	 2p2vPTH/RjnPsmHb7WrtKL9UwivKxZ+yZMiP+vL8BFH7sntaj5Xt9YXubV2elkEgo9g==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601811;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
	b=zE6/S7Lqrf5hZvlHh2lJwCfmguovb1Vk3vI1kA4IiTsqJ0vXDf0na4+HVb8+eumPLJNg
	 Hlc3Uyl4+aE8Liy++BgFwB0hUP6Stx7qylGzF+dIgnACkN+lq2S8ULR7aWFivIsTeX3lh
	 CJM0UYjIBfBfxDqrKmWRbGEjRdti66qm7oejqqmZ048aAnM+hHwUPX1pS6x8iEkIAF5gC
	 /nn5bVxeWw73xxeEtlRMo5Bvb0dCQF1cxyJF39Q4Fy3R1dcQZITEwpbvE4BA1O4UYyJn6
	 BzXbnnMeXyqCiR7bTuuxT9QF3haqCJyM7JJMsVxi+pS3Uu2swNDUGE+iMw0hwHiwcaw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ea355nfN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWecPzx4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3376A606A335
	for <soc@lists.linux.dev>; Mon,  2 Nov 2026 06:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ea355nfN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWecPzx4
Received: by smtp.kernel.org (Postfix)
	id C241A1F0093A; Mon,  2 Nov 2026 06:43:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793601810;
	b=edCYeVP2eWTXTuyjdVmDTzoSB/yJF9ZkLtnha3f0OO+MV0qYbOczK5EDSLl7X39VRnq3
	 MPPiX5xFla9ebLlN1jVdy72vkwfaN8vsnAz0DpBKbHqBCzSaDCpJixCr0s5SQS6YOV0nD
	 OsztsEaYlIPfLnzk5LLVo3da6PzUcjlyOR66AQEF7/WL6BAT0/Qw5y71XXG+d4/kkNPfv
	 YnXsWHETjj/U4pLEyQwIqjNBEUG9rgnV2mW46Gs+8WJ73K8QXDj+YtP0ZS+iPvka/Ilf/
	 E8KYvwd+jyxd1+u07gSA2MuRJ/Aa0oIq4xc9aPLanrDDH6sA8GVqSxZuwAMDFj/N4xg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793601810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
	b=DDfGdjvhXUQtKX5CxS3BW1Ap01heWEgWEoTFan3weOU9sFgnlgjn+5eb8mjkQKxsGvBx
	 vj4hSg4AgQgKHr4E7t+1NQQlw09NhEk0BnRQjQILjOZHlYGhip3+DDdN17u6H63fBVPht
	 J5rkdRtcWGhVKvHJy1Fijh3Wts0pcUeqYoG3gNS5fHZDCxv0lHldvC8LdLnINGJ9DcVBD
	 KoXke5ZOdYitpAmlNK5n/5Gr12lTThehnLHHUJsQve+s4/l1JN9qInslUAMPJxM1dMawq
	 Yph1INveP8ThxHzJMMfz/qCE+lxHylaPaj/in+sMFTIOw7RnS3ePKF+hgYkZ94rm1VQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ea355nfN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWecPzx4;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0DEFB1F000C1
	for <soc@kernel.org>; Mon,  2 Nov 2026 06:43:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ea355nfN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWecPzx4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0DEFB1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24CcmA1811538
	for <soc@kernel.org>; Mon, 2 Nov 2026 06:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=; b=Ea355nfNDVTQvAl2
	xBG2AMba+bhyh8m8w+ple6BS+BpH1fD4Uc7p/HU8qj0QTOWfTBFTZnh91OzIEn5w
	4JiFIr/axfiMk03rPPGBMKGApqWMWNY5J2ruCk+8/4RYb6edJ1EheDzoqA+s/UKJ
	SXNk+9n1dO9uG+jAgXc/B6ctrx8DaurPYyGbFmh+v7wTdNdif9Bw8nrwGysIjvXP
	eih/xJQ78Ec7Y9zeRkvhXivOYmYhs+0zxc/GzPi8cngBaPVWHkZ0MuMw4jB9ldNI
	K6VAKdaNRsclgQ0sBsNl6b9F3PWUUEb8yx8y4ohHGhzapcUp7KTWrVFX9FgKXvFE
	KeCCLQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgdt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Mon, 02 Nov 2026 06:43:29 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b16286c152so49649257b3.3
        for <soc@kernel.org>; Sun, 01 Nov 2026 22:43:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793601808; cv=none;
        d=google.com; s=arc-20260327;
        b=rnhPN5kTHvlJZ9uYL0bp9SL1nh7jFbKTEbu5f6jB2gDx80Eua7Xts8Vi8yTnxS89E/
         dEnAquAU1cy5nXyrB8WB3v5onVNsGHHLbGAtV93paRwo0g6mRuWJcs0PjoOX82XtV33k
         fUmPR8h/ct2JFErttTPFqC/mK8cSKevTWZUdDoYKJPNTZ2CLObnyfqZps17l88liGYZY
         GWC19wXjc5e/GS2dBfAhsAYOdhPBWbFaVI4DdeUkNEhwNxYbB4XXX216+Lov4bakZFPR
         b8HVJAMK4Qw5YSvUwI8/BlNFYll2RviQw3yduk+xbpjUNN0+4X+SZgB5/+sDVrxdRp2L
         TKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        fh=W3SonIeP0vwoR+O/cxuikU5r/BQhGmwDE0aDx11Mnp4=;
        b=gb2cwbTk1PHzaRN674yYeeSjoh95BFnXG34NvNbiAY76wZLRESHkRVgZ9rJFcEWvv7
         DizE1/5/HwRMqIsRwg+2AcfnN1XNisQ6BzWQ6Uv6ovAhQPwivUtQCiL3X+qEzRyUKyfk
         ee7pBjKbBl0loiMZi1M5y6QfFN1oBFpqlO2cAqzfjyekUWCS7IRo29jn3dxOVsMc6hBZ
         h9qPEzxSawBXMUR9GpKoPrkq41bGQAmpMHZZ83G1T4uYBj/LlHuP1WL6Y8nuagOHunuF
         W0J0gnXDKQ/VEucc6rbrsKP/TaRtk9jaRlRNmH0lqT6gAJuUvVmyyI6yyTsHNsNLwJNr
         jzkw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601808; x=1794206608; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        b=iWecPzx4bsK+iF3pWFCgeFtCaLCpX+qoTBRWwICYcMe1tW0XUs21z595c6WPW/dJTg
         LY4TQX7l3CNjgflMLmOOJfQPkrRNHNBi2fnmFcACkCABnx7WgUqUgaUkN1bSguhhIh2E
         0R17cgb0HwxiTsuuR8DLwRJHsk6GvN5WyE94+wXZruu2uujw6sOHJk7wsd+rsQBEU7tB
         /Iv3R2MnoiqKOsjtiq/OMMDnVCJPyO1m3NUNBk32W5YoaL7zZZ85tOyX3Q2xPUnb2Czf
         CGKn1kWOJteUQKGcP0b5fGjRLaoL0NGfzxFCX3XaZIWowJ7hxlmugfcUKC3WTO/80eMl
         AQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601808; x=1794206608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        b=Yvn/OM/h6lVpfCLv0CjNlT+z+HveZbEYSTPK5Q3t4HVkqF1hnCL9NBaNHTlGwaEmVp
         CgvSeFeTzUkapYbifzcnLD+n6urBS34uB0rqNIUDR7hZLBomTuNEebLDfHSFkiuabgIq
         pCgmn1ecr5KASROUNDI04kiExOhGX26qBNrGlmPAjENtTopcH0x+f+3QefYPJ40WiTHt
         phyfcECy9jSVtgty2qWM+dFSZ9mIvYmndOaOD6oBN1NG8VeXFrE6qtQt9xbN4jDodm5N
         U+q70hF7s1vHCk8VygPr7xfWtDOA8C91o+arGt0Mofvv6u4JoLLY055TMb3/29vk+RDo
         DM+A==
X-Forwarded-Encrypted: i=1; AKwUvBw/rZnfhskdHJB4893kZ1Ln8N/+9TwsZpAr7kBIvKQHEWudK9NPD/o5l3iKvFRZEKEuFvA=@kernel.org
X-Gm-Message-State: APuU4Z9R8l2p1IvzXLqatpL8DOwUxgIL/NoYTMoO0NEQqP2wQ832wY51
	Xzzf0yfU5Yc8q7T6xzGyulkg3NWl7CaWCblvyMGejkleM6/fMtNTd3jeTnX5vOGgxuFsYtW2SrY
	fTapoSKHdCmboMovMRCSd2u0S6weEc6WFMMY0p0dVUs3yOXRKpCFO8tfXSV29CWkF1IO7twX+d4
	vwUNrJm3BMqEgG1klqZ/TTX64=
X-Gm-Gg: AYBFou2MkUIzgpQve6bxv/YA/FTby3Cu40HawakCrJG8Kf7JqUuKYROB1HI3eH84Zwo
	KvbJsfxhAmkYPL9yvfoc/fZXHEmFxRX1IR7QcpyWPC84CPWjSmeKjxCsNMLOlUz5m3unMU/NU6Z
	z6tnysPnuNGbxfTIHZo3VJJ26CTSrrLJ19JzeQ7qTB2aKtYXcXLlWKRKosZw==
X-Received: by 2002:a05:690e:140e:b0:679:99ba:180d with SMTP id 956f58d0204a3-67ba4fd0dbamr5409941d50.61.1793601808199;
        Sun, 01 Nov 2026 22:43:28 -0800 (PST)
X-Received: by 2002:a05:690e:140e:b0:679:99ba:180d with SMTP id
 956f58d0204a3-67ba4fd0dbamr5409926d50.61.1793601807648; Sun, 01 Nov 2026
 22:43:27 -0800 (PST)
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
 <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com> <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
In-Reply-To: <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:13:16 +0530
X-Gm-Features: AclHuK_nviIyG8fb19_CXIlxqxPEMtYwAJZGKcLdxWVe1gcuMOlrBn_vK9GS17U
Message-ID: <CAGptzHOtC+D8uVcLph=k9ZkbJALmJS7SrBEUHK5mAT1Do6HsXQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: wwScuunNtVHdjK-0oXNOuaRZrx9oEdbp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX066HPb4oezH8
 /AGP8jA79ME0Qjop2muDjnz8j366wD/EIZVu9lLGV84fgXZzSrHwYOJKW9OuRKBxksh661zAntZ
 QJ9zbe2lcA013tk/PQDXMeol5EbzukYuXz/qmRfPMpM4n692U4BmKkF2zrpHaywVE6uqpv18LEf
 XRtPqcZBSh07JFrqlVF/tW5o/GQKv7oiv02KCeIpVGosjEYxpj25jWB3Riewr6BYckaAysdE0RJ
 aksssROa3Uzy5ZwqSfH7WoDAnNxvweuklWD8BHYKBwzINUONzqwf4wUqxYovaswSI4boBsXNtnQ
 cggrueq6jeXpR5in6Xk+909AkzhvwPKGkV7SOMijevDbUcHSJA4ES9ruRLlaYnRdlxQuk2adxi+
 DqwU2AWJMk4zESn0PJ0ExgrQo3HCzA6LC5O1rW/aMvOy33/KlwN/wMksBjDZYAtwWQD9+JVW5w8
 p3+T77jpBmhuu5IjNxw==
X-Proofpoint-GUID: wwScuunNtVHdjK-0oXNOuaRZrx9oEdbp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX6IweKMLrX342
 9VwTU183hcFTVquATPqQsqMZ+3vov7lV+S8qiknwgBkDRd4WMMDmBTvwF3K9HNt+Q01w/0IfR5a
 9m0Nz0KJwOGVGnJu9livPCiJm1KNml0=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae83111 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=ygn1YfmRgnNSw8eP3TAA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026

On Mon, Nov 2, 2026 at 11:39=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hey Bjorn,
>
> On Thu, Oct 8, 2026 at 10:35=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualco=
mm.com> wrote:
> >
> > Hi Arnd,
> >
> > Coming back to work today after vacation.
> >
> > On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> > >
> > > On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > > > The following changes since commit cee9395acd8043be0644b25c34bfa866=
23f2b935:
> > > > ----------------------------------------------------------------
> > > > Qualcomm driver fixes for v7.3
> > > >
> > > > All clients was migrated from the Qualcomm SCM PAS API to the Qualc=
omm
> > > > PAS API in v7.3, remove the now unused direct API.
> > > >
> > > > ----------------------------------------------------------------
> > > > Sumit Garg (1):
> > > >       firmware: qcom_scm: Remove SCM PAS wrappers
> > >
> > > Hi Bjorn and Sumit,
> > >
> > > I was running a little behind on the fixes merges, sorry about that.
> > >
> > > As it's getting a little late for 7.3, I would suggest skipping this
> > > one patch as it is a bit large and is a cleanup rather than a fix.
> > >
> > > I would instead merge this directly for 7.4 but still take the other
> > > ones for 7.3. Let me know if there is some reason I missed why this
> > > needs to be in 7.3 after all.
> >
> > I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
> > to keep the dependencies sorted.
>
> Looks like we were also not able to land this cleanup patch in v7.4-rc1:
>
> firmware: qcom_scm: Remove SCM PAS wrappers
>
> Would you be able to merge it for the v7.4-rc2 at-least? This is just
> causing issues with patches being developed on top.
>

Apologies for the noise here, I see it in v7.4-rc1, the tooling I have
confused me.

-Sumit
