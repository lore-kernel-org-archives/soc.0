Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793837499;
	b=gHDjPVZmJr0n9ttq+Pb+MFdPmiIkHI8slBqJRSPriFgwAm5PZwRFhSKNk9Bu+YK4epzT
	 Z1Yd2uDXJIlXQMQp0RmpOtOycf6spQbuPoKoQmQIEv92qhC7XmM5pZtEHGzDZ3Kgt/GqT
	 LLWpanV5jmGYFLhxjpUUUVHSW7rYEVYw3q/St8dKBYDLQeIAbD90R6M77qsw3C8GIvocM
	 +jZuE+KxMX3Chaa2AZi7VD18iNPfQ5rKwJ9xWHvLSOLvkYil+mVXnOEvQKQQ20yumOIHn
	 Jv4LxpF1GD9S1p5RwFHVvKi7sq4ERKnUcRe7J3oEwStP9QX0GM2tKhy41H8veGE/iKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837499;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=;
	b=nM9PMeH5VjIKhhGI3W1EIRMQlU1RHblXgti4bb1wUhVOKdH7l0UgJK9Q3Anz5qpUWDD9
	 qHvpPk7ZwlQYWcBCSy7KBnAMcf8Y2oTJkT8TzwewdRgBo+9463FGXCGddMyAR31TFT4B4
	 Q/Mu9Jqu2x0ZgQeYbyVxiJC0jsanBOZ8QDuK734sc5syvfaBwLPbJPoKfcAdxmVhTXbmU
	 plFytUTY8t35SPTbsezlPbgeKXIezEtrhKQHrpxyIFYnfFzQ6LRX72H/Pzt5Ho5vjDZyn
	 fF1T7mi6k02JtVBEHErEODjrcR/ZUkAiq18FBQOJX723/YnIm1OUXfnPmCD3n75rO5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d/1758ii";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBrTljke;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E17606A330
	for <soc@lists.linux.dev>; Thu,  5 Nov 2026 00:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d/1758ii;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBrTljke
Received: by smtp.kernel.org (Postfix)
	id E9BAF1F0093A; Thu,  5 Nov 2026 00:11:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793837498;
	b=YzqUBotzsSQlJPa4Y7ILpOdkoHoTABYl+A1KuTgSbuLzi6ro1NcFW6pO83k/HT5Yvqom
	 WSCWNSf+bmNYlaTlB6Q6od3j//LiyHvpJmrh2ZKHuwz6su2U+ENIH+eer4WUdeBnwJbLJ
	 9gIuIYttwm1Y20xtW4OxJqUXXgvMlubRdd78u5EkX0QWnVXtrR5dk51xynku/JoCGOjeQ
	 GcFwSjhl+RB6F2/T4+NgFuTV2EBOdtcVWVahWfe57c2ZQENHZb8mi1PL9ZXz6+Qn8kw4q
	 bI3WxPcvrY51uSOGp2I/65enRv8Yndk39Smj12P44ub+vOEh4+pUbZ4IWI9QWKBIf0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793837498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=;
	b=WN2rpPhiFZx6dLLDXDUL8ZdaHRiGh4mV2eNmhFc2AYaW4FFGVDKFz40DyMEpDXVzUR73
	 cqgSl6QdZ48KP5kcS8cy/nEQLSZ59LL/bN83Z7IMDH83jcprnAkGZbOp5qCR4mdM6n9p5
	 8enWZT24fl3LvSXw41h3WZOoAGNXI6lFjn0RJ40Jf2ycTUV2Ykt4TDRxyrFL48Z8OHi/T
	 JXPWTsn7ukHeAVcTk6LjKA0LnAJhzPOVyrUnKdMGCUoLN4LScpRp2Uc4Ju9ra0Pt440Kf
	 QYwXYxhb7691V0KTEU3U4Ukxy9BrPEOhIPXfx65Hf3XQMU4x6BwmsSUamh7p+3Jqb0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d/1758ii";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBrTljke;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 497BD1F00A1A
	for <soc@kernel.org>; Thu,  5 Nov 2026 00:11:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d/1758ii;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UBrTljke
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 497BD1F00A1A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4NbNqb3031325
	for <soc@kernel.org>; Thu, 5 Nov 2026 00:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=; b=d/1758ii96ozVzWf
	BzzbSupEWj/IFudrwFQhlL0mxAy495leOOosbr+TuXez5+xLgMEe3AEPxL0W6b9r
	Uj8Pf8nlU8Hg1gZWQKTep2g869qG9qoiRJR5nYSwGz8WipojGnfUTNiuOm+oa7NS
	FZgygGxzyCOhlXNXdNNfPU0oH7nT2juze6RJ2RlTQAm3B9dcGAIPgLiSDlC+9jtB
	I74mO2jf+pOWK/kwSF7Xc6iKzcoLHVJFFYrHp+aeVlmb05UGSvZhqzS30AJjzTW9
	QWD3AGHJ9Qt6WVdxNu6ZCV9UwugkXsxhv1vnJG7lN7AdAkpI8Pjxayn4QYQAyWwT
	erYWuQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv1pyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Thu, 05 Nov 2026 00:11:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso153049eec.0
        for <soc@kernel.org>; Wed, 04 Nov 2026 16:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793837494; x=1794442294; darn=kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=;
        b=UBrTljkeEvNJqZMJ64WAUqjq1p6cbROoBs+pbvhttdsEx6a3vE9BzSATYjGu+e7Pgd
         zw0PpZhc/HHVT2YcJLwrP+ECVyQ19hpF2ujDZNIp7rnS/ZaXNY4hn50g8+B0Z816yvwS
         rTUL3a8Isp2DIuE4RQDIn64YqkKnSRIlMJ12GGjUs8NfkOmiH0WpdCGgAKdwCzWyT5uK
         Pp8Rcho7+ZR7bXipQwPhjcxWcrFfdS7065cYo5ST+UrtKJ9ZUvaX+uXBTvQ6XqdDe7J0
         oXCwRJytkuApLs0H+5F111MvqoOcXsR+66NhLvyLhXgwTjhMoH3XUFhK2P3WoVFIUp0N
         FS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837494; x=1794442294;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVQeXawDrt23PfxpSVgUQcYKvrbayL+kqPTtMOiJzmo=;
        b=Ge71hK7pF73K4t8dq1YJQQECNfRZLbjzV5baspOHLTp+DUvcIrs5rGTZpYLUuNgb5k
         tiwXf7VUEtHc51t+S3FfG9aaYq2sWQw99Pcjr3A1+yJB+2ACWsMqk83fAibDt72vkpCD
         GypmvU2GtBleFllq3oOPCF+qk+ibL9d8PNa1yw2g0Yhcn+QXrMyqN92G1LFqFlMadRp8
         bcxWO00zvF19rRpkYF63SXEEN+w6HBbGaoTQYg9GFTFQyMCSW5asn0lg8heHY3/mVXv/
         i5+0sLQtSLxMI6BN2RPO5cBVmtgiSVsYqzjvgDrHHOaziAreBY8zfuu7T62B+qX7fe1d
         a41w==
X-Forwarded-Encrypted: i=1; AKwUvBztTWOOHJIJrsAu5kgCB7Oz1OeKM34XJik/tZo1MJOlNVweIoenXS0/bGf1sNHq2V3SOdQ=@kernel.org
X-Gm-Message-State: APuU4Z/SQf6zQ6qAzJyftODTednD8d65CKOx7jY7BXhxTE+8Alq4b9WA
	aJc5lrBEL2d59igg0sM8hNJy3XBNPnBQX2DHOaGypTabMjNJRQkauiSFKiphPxrFswGw+Q+aWMx
	an/5Hz/jZDspNUMq8kok4xbeo28B/62HFxfkywhX4vX2TZWQPpXTlIKVz
X-Gm-Gg: AYBFou3KkBsJ9XuwhU5nJQaGULqRcECJhC8ViCZZEN5PT4Q7X547gSM2q3XievxR7ma
	WKSB+nQyMXQZOkOOAMoAG7wQBj0OcTkHExu1KLx6LvdiLd1maTov5CTySUHAjcN/Y1zNTc2Syuz
	we7BXV8A85g076K5e3IrRkksoAnhA569L4CXHxevkRO1Q9dAq13ephBSqM3lkGzazZTGD9wh2zY
	Gu2g8cSOxD8l9wtLaKDA8FsWsJsAjMvndHp2U+lwwKHcVkfU2lDNyIftmNJGoo+6bEsWX+kiAch
	4K9XYleJc3D6SPhbDp/bvNbf35pwadILzMUXcjEHrtxUBYbK4PklkukZYDEoDfUDfRu7CeLLync
	JluI8zeT3+4IkOP8+kZH4+51BZ/RLH0GihLMoTPRAnfGuyNcuIy2xDi94pQcucyLJfh1PseL2Z8
	ROoQCm8jtTqX0Bg8inOq2NB6PINw==
X-Received: by 2002:a05:701b:418c:10b0:1a7:4c5f:57e9 with SMTP id a92af1059eb24-1b24f4e4cdemr1394416c88.27.1793837493610;
        Wed, 04 Nov 2026 16:11:33 -0800 (PST)
X-Received: by 2002:a05:701b:418c:10b0:1a7:4c5f:57e9 with SMTP id a92af1059eb24-1b24f4e4cdemr1394386c88.27.1793837492930;
        Wed, 04 Nov 2026 16:11:32 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm10961037c88.8.2026.11.04.16.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:11:32 -0800 (PST)
Date: Wed, 4 Nov 2026 16:11:25 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
        Thierry Reding
 <thierry.reding@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, arm
 <arm@kernel.org>, soc@kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Len
 Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, Hans de Goede
 <hansg@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Mika Westerberg
 <westeri@kernel.org>,
        Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        James Morse <james.morse@arm.com>, Ben
 Horgan <ben.horgan@arm.com>,
        Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <20261104161125.00000523@oss.qualcomm.com>
In-Reply-To: <autmcaraWcXIoRfZ@ashevche-desk.local>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
	<20261003095924.1370238-4-thierry.reding@kernel.org>
	<928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
	<auslF5pwDHtcNoCy@orome>
	<bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
	<autADOKsSVVMn6r9@orome>
	<CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
	<autmcaraWcXIoRfZ@ashevche-desk.local>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aebc9b7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=QyXUC8HyAAAA:8 a=t4CJLuyQXvHctLNzf8QA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwMCBTYWx0ZWRfX82c29yiT7Q1p
 h8Ek8d3+wY90Yp0S3VI/IWksa3zXUf6sIeuriM/PVShiN5l22r9GTsKz0nk2whCiR3ZDoex9372
 4+TTCWkTBXWxUzTGJIRdA5bQlJ75j6U=
X-Proofpoint-ORIG-GUID: rPUlQEh6Dg1dLyJ3BEoyARXfDA8PXLw2
X-Proofpoint-GUID: rPUlQEh6Dg1dLyJ3BEoyARXfDA8PXLw2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwMCBTYWx0ZWRfX5GRb8IiKELEk
 Hhnlkn9EFfxIWTtsvouQyAwp5Uncg/81lxpmgOpwPaQ6SQsVNWMlg9doAONJ4HpCf/T23ssH94L
 rc2qmlArVUZfxpKCgRF6A2rQ6gfUJvyq8U6YIcH0s8RC5K9Xn5SU7fVZ4ufSIKqYJ4XMeJW0HIV
 y6iCGR+jAhe0SGvxso7HL3hHjT/B/gavbRra5YeAJooiihYehVOleaFrXx25YEi1fVZtm89BE8C
 3qmkJO6qxr6dCCOD1iIqPaJNnWUWQMnYC/W0kQp1EhYQBMjg5ZqcqMmmfOd3JtJjHUTABSmoGQN
 A1DBw1j5Mjf1C2dyibFFbUcgqW0LmaHSDSgv21DU0PJJqnhKKENJ3KIU3APWDIWR36nXEbqRNUF
 hlrCy0fyGNd6dBBNpcvx2IiUTT/hOFXyfHSaPNl76HsaoBgU36m71aw9Jl99ZRFg/7gx0245SiU
 XV5EWgsTmx3PHypoLvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050000

On Wed, 4 Nov 2026 19:08:01 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, Nov 04, 2026 at 05:28:18PM +0100, Rafael J. Wysocki (Intel) wrote:
> > On Wed, Nov 4, 2026 at 3:41=E2=80=AFPM Thierry Reding <thierry.reding@k=
ernel.org> wrote: =20
> > > On Wed, Nov 04, 2026 at 03:11:09PM +0100, Arnd Bergmann wrote: =20
> > > > On Wed, Nov 4, 2026, at 13:42, Thierry Reding wrote: =20
> > > > > On Tue, Oct 13, 2026 at 07:22:23PM +0200, Arnd Bergmann wrote: =20
> > > > >> On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> > > > >>
> > > > >> Where is the ACPI binding documentation for this driver, and who=
 is
> > > > >> responsible for reviewing it? =20
> > > > >
> > > > > Sorry for the late reply, this fell through the cracks.
> > > > >
> > > > > Admittedly there's not much of a formal process here at all. Anyt=
hing
> > > > > I've received up to now seemed to be fairly straightforward suppo=
rt
> > > > > extensions like this where the ACPI tables basically provide the =
same
> > > > > information as the DT via standard resources like register ranges.
> > > > >
> > > > > I suppose for anything beyond this, we'll want better documentati=
on and
> > > > > broader review.
> > > > >
> > > > > Is there anything in particular that you're looking for? Should I=
 guide
> > > > > people internally to always Cc linux-acpi for anything that conce=
rns
> > > > > ACPI? =20
> > > >
> > > > I don't know, I'm also still learning about how this is done, I
> > > > was hoping that there was already an established way. =20
> > >
> > > Yeah, me too. Maybe Rafael and Len can provide some guidance here. =20
> >=20
> > I cannot speak for Len, and he has not been actively involved in the
> > maintenance of ACPI support in the kernel for several years.
> >=20
> > As far as I'm concerned, the code maintained by me is mostly located
> > in drivers/acpi/ (as per the relevant MAINTAINERS entries) and it is
> > mostly generic code related to ACPI support.  I generally don't
> > maintain device drivers using ACPI support except for the ones under
> > drivers/acpi/ which mostly bind to devices representing interfaces
> > defined in the ACPI specification (which is kind of a special case).
> >=20
> > But there is more.  There is ACPI support code in other places (like
> > for instance gpiolib-acpi maintained by Andy and Mika, or platform-x86
> > drivers maintained by Ilpo) and there are experienced kernel
> > developers in the ARM ecosystem with quite a bit of ACPI-related
> > knowledge (Hans, Jonathan, Sudeep, Lorenzo - all CCed) who can be
> > reached out to for guidance (and arguably they have more experience
> > with ARM platforms than I do).
> >  =20
> > > I don't know how ACPI on more traditional platforms works, but I imag=
ine
> > > that it's a lot of the same anyway, except perhaps that people have m=
ore
> > > experience with the spec and today might be doing a good job already.=
 =20
> >=20
> > If you have any specific questions, I think I should be able to answer
> > at least some of them, but I'm afraid I cannot give you general
> > guidance on how to do ACPI support in device drivers that would be
> > universally useful.  Different drivers have different needs.
> >=20
> > There are things in ACPI that are not present in DT and vice versa.
> > It also depends on what bus types we're talking about (platform vs PCI
> > vs USB etc). =20
>=20
> And don't forget the big player(s) such as Microsoft that from time to ti=
me
> creates an "extension" to the ACPI (in means of additional tables or how =
some
> of the existing data should be interpreted if it's not clear from the ACPI
> specification). For instance, above mentioned USB ACPI support for some c=
ases
> heavily relies on the MS "extensions". Or earlycon support for ACPI is ba=
sed
> on MS defined SPCR table. And so on...
>=20
> > > > Having a review done by the ACPI maintainers would definitely =20
> >=20
> > So as per the above, who exactly do you mean by "ACPI maintainers"?
> > If you mean "the people maintaining the code in drivers/acpi/", that's
> > just me and quite frankly, I'm not sure if my review, specifically,
> > would be super-useful for driver development (the fact that my review
> > bandwidth is almost completely saturated nowadays aside).
> >=20
> > My recommendation would be to ask other people within the ARM
> > ecosystem who have more experience with ACPI for help.
> >  =20
> > > > help from my point of view, but I'm not sure whether they are
> > > > set up for that, in case there are a lot of new drivers. =20
> >=20
> > I am not and had I been trying to do it, it wouldn't have scaled anyway.
> >  =20
> > > I think platform maintainers need to be a first line of defense here
> > > since they sit at the intersection of a lot of this. At least that's =
the
> > > case for me. Also, I'm eager to learn how to do this right, but I'm
> > > often at a loss of where to start. The spec is a bit daunting, and th=
en
> > > there's various extensions, too. Maybe the AI genies can help me ramp
> > > up. =20
> >=20
> > My advice would be to reach out to people within your ecosystem in the
> > first place.

It is a bit of a guessing game to figure out who are the right people today
when it comes to ACPI and both ARM and x86 platforms.=20

They fall into a few categories and it depends on what you are trying to
do.  Starting point is push back hard on your firmware folk wrt to shipping
something random without an upstream discussion first.  You wouldn't expect
that to work for dt, it shouldn't work for ACPI either. Features
will get rejected if people try to just do something that works for them
(same as a weird custom DT binding gets rejected).

1) Basic stand alone driver stuff.  Mostly that's all pretty standard
   and follow the specs where possible.  If there are gaps start asking
   questions. Linux definitely  doesn't support all the stuff that has been
   added to the spec in recent years.  So this covers things like register
   addresses, interrupts etc.  All fine, hopefully a subsystem maintainer
   can take a look and will have enough of any idea.  If not ping the folk
   on this thread for help.  Things are a bit flexible for consumer type
   devices where fixed and bodges are common, generally less so if it is
   server grade hardware.

2) Stuff that is an ACPI spec gap or place where we'd expect generalization.
   There are several examples of this on list this week and a few more in
   my inbox.  The particular series here might fall into this category.
   I've not figured out enough of the details yet to say definitively.

I'd also expect a driver using AML as the target interface to either
point at a published spec doc, or to include some snippets
of the AML - that can be a lot easier to read than the driver code
(imagine reading DT by only looking at how drivers parse it).

FWIW The driver feature in question looks like it is doing something a bit =
similar
to the PCI trace and tune driver Hisilicon has (though IIRC that has
a presence as a PCI driver) https://docs.kernel.org/trace/hisi-ptt.html
or if you squint at it differently resctrl / mpam fb.

Given that has new ABI etc, I'd expect that to have gotten broader review
as well.  Probably keeping it to linux-tegra and lkml alone wasn't
going to result in anyone noticing!

https://lore.kernel.org/all/?q=3D20260929095915.2215685-1-anrao@nvidia.com

Anyhow, feel free to reach out if you want some feedback on this or
similar. I can perhaps at least point you to someone who knows a
specific area better than me.

Jonathan
=20
> >  =20
> > > > I assume there is a knowledge gap in both subsystem maintainers
> > > > regarding ACPI (certainly this is the case for me for drivers/bus,
> > > > drivers/firmware, drivers/soc, etc) and ACPI maintainers regarding
> > > > many of the subsystems that we support with DT. =20
> > >
> > > Agreed. I've seen some patches where the ACPI support was as simple as
> > > just adding an ID table entry and the rest was all standard, but I th=
ink
> > > once we move beyond standard resources things might get a bit more
> > > complicated. I imagine that ACPI may not even have specs for certain
> > > aspects that we currently handle in DT... =20
> >=20
> > That certainly is true, but the ACPI specification is under active
> > development and pieces that are missing can be added to it.  There is
> > a process for that in place and ARM people take part in it. =20
>=20
>=20
> On top of the above in Linux we also developed some "extensions", for ins=
tance
> how I=C2=B2C muxes are described, or how some multi-functional devices ar=
e being
> enumerated. These specifics we usually document under
> Documentation/firmware-guide/acpi/ (see i2c-muxes.rst for the mentioned c=
ase).
>=20

