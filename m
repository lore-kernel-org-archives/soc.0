Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19E3390CBA
	for <soc@lists.linux.dev>; Fri, 19 Jun 2026 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874725; cv=none; b=cY6X55jXYuu/98zpw29w2OJWzWY1K+4FqsnMpTttuEmqIMHuxGXuT2qEyIzweKTmonTVMyvC9gz7ALAXAEbkW8osHjtw4CNdW+R+Ov8o3CSp/zmeikgNq1Zrpy83w4yTXBUk4eKg6pE/MdxNHVvvjxFgcYP+Bnm+3fLJcVzNAx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874725; c=relaxed/simple;
	bh=4ry7dWwDqy+5DMW6DFyri1Xj7ugqGCrI6plXuJpvo5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SX555PSVExk7GnQNmS7J7Yt8fxM/qxlIMn802PMhOXfvEuIjJ1munP1DjNcTPW8IijVnOdbfsEnFPiSf9+lZ488Jvn6rbUmrX5Y+9rLyCkzBqNOelYJrlzMu3GoSOHQkVU+QJwywabFQl31LxnxU4Ppt0NlcqHHti5MbHCyME9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzanUwzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OoZMiQYR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzanUwzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OoZMiQYR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9Whb291571
	for <soc@lists.linux.dev>; Fri, 19 Jun 2026 13:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRfoyPQGltYSRfxFZr8LolOMz3lbDOSEI4D1n3rMg0U=; b=DzanUwzYzk9w2Wzn
	f2lfzsZUjTymklzrnsb8cRGHznXx1jppvjnmevQ1qfWaf2eNwGWehwauL/3+wo2F
	COhk5zenHTfembdrc7N+izw5OAk/oS/pjaHdXYe1t8koUbIKglI4w8MBGDt38So1
	DihcbIzURhCGIJd2c1/P8zeDnCDO/lTG5gsGqhvDt95ikPurg2byggA5KkTHo9gg
	kdjIuJNV1Y7ON2cRjzpeGnoI4CWT8bQPelL3zl8mBHfX3IzQ5yzxdMiWgrfRFM2l
	Lym1ZMoA0+Xhz8Xcns4pwAASdAHWmfBStcA/rkPfKdTf0wowUk4ECSuNoPxfDQXZ
	qkqAHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm26bw19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Fri, 19 Jun 2026 13:12:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c725d3e886so10891715ad.0
        for <soc@lists.linux.dev>; Fri, 19 Jun 2026 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781874723; x=1782479523; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRfoyPQGltYSRfxFZr8LolOMz3lbDOSEI4D1n3rMg0U=;
        b=OoZMiQYRgD/PTMsSb1Z9v27KR6xvzgyeyPnstMXctxoAlOwXlC6E19jcOWsFqk5Xt/
         HQdUgeCWs2u8ae5/wRJfaRLz73QS/S5pPXA0vQ75VCXJV7fd2tR/jySOLP7EBJ3+ENLz
         dGXoMzsQkjvtsvtEJAV9t0b33FHC078H3LBQguToQnGYKqEHsAmqTpI/l0rqMO13wx74
         3auFvC7HhgQRQ5851VGxmqZ/TXTdEsGVi/aexv6S+3BeGjh/joX3l0zK9etRv9t8Npwk
         MJCoXl1brnmV0A89jDrzWa+IeVNI77rSqbDQjHpYaouXGX819pqE84eVbgH3b1Y8VHpy
         5XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874723; x=1782479523;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRfoyPQGltYSRfxFZr8LolOMz3lbDOSEI4D1n3rMg0U=;
        b=R56EzkMEqUFZCQ25OJEzP7Y8OCKWOAr4NBA2OrpsMbNbJo0BI/sopNYpGkdvI5+AeS
         c0Gho2VRjsRUOwD7wQrsaD7TCbcAHRZKD6596Ji/vE42cWX76YgjxbWd8cCbqvjqipX/
         HYNxFhMLI5CEYTvOvk+SnKCj7VEn23WdncWd+T7+72uYTYBHTy7+pwDWbdmhq2J90zbc
         gQaahHyRZN5hn9Dp0UeTSVee99pmXMBDdnKxq28ezW7mtFttMQZm3tbHoyYTjwz/A0rN
         otgAcRs0nAjQb+c/emCWnpPz48eoC/aQ1utjHNt8fLoYgM2IOP0hXXGCb1rmE4lDnR7f
         +WqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jjYEJrDx+cOKG1xTDn49CfrPJR38zGpLUHxyUq1oAosuD4K5F7pDqdk/z46KSaNs0svk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk+eEZXfhqzj9P4L6ZYnssj1VuZOpIqmzqn9OYHgMS4YsHU4wk
	eawHbcjwSiOebCVlpyKcdrGxrzLFT5qTaLrog9l0mo7QfEYSPPlQ3Mlz96CLtmFaT4E19PfjBhb
	C2I1jLafl9uspwN7KJnK4N+nkLdg9LVqkN83pPPZ0KLgu1xGmZdBnoZoo+/ngdbY=
X-Gm-Gg: AfdE7clexfPz6whSV+f10Llm5LKJ/wcJZvKjSwij/PhY48+79ZYfsJU/ffaCkAgoiEP
	mfsg9Gup1vNDX0AKPiLWGcYR8jYyBLvOdzjL2yqGmOIUnn2Ci4ywumU3Pw68WN2hx2PGWZOtXsm
	h2/NSRPYs33T25qisAICwkmtaGaFImwGG1gszs9M0YncB+c04RxLGrx5fAeWMOcO1dIQikLrJGG
	oNZ7r7k0cWPQyoQzPdsa+ta4FM2WYrtmr+G1f8VULI3f5olPHDOPtbGRypjHGSEHAcTxwSbxIkW
	v751WOOd4iSZe3NEQOEjAj7n/3P5STPgeyMUfB5ecNaX+ZeJvcWIEelkScfYFMkAKY6wbwOOLHh
	oNE3otxDDciMBbZN09jCafv3SBZNx7vkpXko=
X-Received: by 2002:a17:902:ec85:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c718c77ec9mr39866975ad.5.1781874723148;
        Fri, 19 Jun 2026 06:12:03 -0700 (PDT)
X-Received: by 2002:a17:902:ec85:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c718c77ec9mr39866605ad.5.1781874722686;
        Fri, 19 Jun 2026 06:12:02 -0700 (PDT)
Received: from [10.210.86.66] ([14.195.1.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7316d44a3sm19597625ad.13.2026.06.19.06.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:12:02 -0700 (PDT)
Message-ID: <ed070807-d2dd-4f0b-9ba1-8d2c8c93c30e@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:11:57 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
 <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
 <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEyNCBTYWx0ZWRfX9ru2neGgFuIW
 MYnspisxMaIlIMaCyq978vtVLRA1sscANnB3BvIGSBw/wG/dzMGL1D2jfvGFKI+mQ4g2jfQWXJE
 2gG8RX8USN9QewFY0WUUwKIDrhWknyU=
X-Proofpoint-ORIG-GUID: UInkHhvQe2n9ym7yAL28T75ckSOxJjT3
X-Authority-Analysis: v=2.4 cv=dL2WXuZb c=1 sm=1 tr=0 ts=6a354023 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZwZsPVarQD+7k2c32RDHKQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1SjQUAddwDT2XRhnGokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: UInkHhvQe2n9ym7yAL28T75ckSOxJjT3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEyNCBTYWx0ZWRfX4lBt4muYls1n
 8JR8GsvaQL3PyoFliTI9GI6pflrdc7+9FzmtyhkXKMJ6objhM/75uuafF//Zj/kIp+ln2ZW4R6t
 YuBK4wRwWtvvQ3h0pNFawUDOya5hqvjR4OFEYbZjeuQu1KpBdgk6dHMM15zvijsffcvZofJX5nX
 ejk2n0hgJkzWedTtunF/wBSfp1s4fIzcPiU1zlWcl0Rrl+Nms0ZwMnq+tfI1nH8+M7fzm1YdWvX
 3J+mxQQT68EDPlbba0GgnhCa/uqAgu7X+TwI043RF16LkBujh7EUc6MxFSeImC6OabS5izWr4fN
 bBa5SqGy6OdXrkN9Znm4appghPUJ2T1OGCMzqzlrbKcMyb95Iz30oVmVHN4A9hCzx2viCojiDfv
 Bh+iXfgALa7sTCEw/CpRwr49aLNS/1YMZ86YcXwBmHJLK3cuZW18W4PzEWsQ4KSYW2yWBkxh8DZ
 xcB1givljpRd9bZeZ9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190124

On 19/06/2026 12:12, Geert Uytterhoeven wrote:
>> +# CONFIG_NET_VENDOR_ACTIONS is not set
>> +# CONFIG_NET_VENDOR_ADAPTEC is not set
>> +# CONFIG_NET_VENDOR_AGERE is not set
>> +# CONFIG_NET_VENDOR_ALACRITECH is not set
>> +# CONFIG_NET_VENDOR_ALLWINNER is not set
> 
> [...]
> 
> I am not sure this new policy is a good idea: none of this affects

I would not call it new policy. Just an idea which got accepted. :)

> actual kernel size, but it does increase defconfig size, and churn.
> E.g. for the m68k defconfig, I dropped all these disablements
> several years ago.
> 
> I don't use menufconfig, so just my 2€c...

I understand, feedback accepted. Patch got merged, so you know...

To share my point: I don't edit defconfig by hand but through
menuconfig+savedefconfig, thus size of defconfig is acceptable to me
price to pay for smaller menuconfig choices.

Best regards,
Krzysztof
