Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEE370AC1
	for <soc@lists.linux.dev>; Sat, 11 Jul 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755860; cv=none; b=bXbKKJCDo/3XzzXUOnr5h+KfB1S+NHVWqVZ5HUR0cRBD/ObIn/q7Y8V7kWDthKSpLcUtP0xhMBZ1Hd3/CMP0vHIPgMX0TaI4rm0EP0OY/bhbjoKO5ACxpwTEr8sysWvwrl8XsuunQsQbD5SYybJOTmZtD9K/AGwONsGhr3d8aJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755860; c=relaxed/simple;
	bh=9ouqP8jZf/TDmh9xTHXeEpZN1d2UP+puaSa5/485d1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxSUhAaU8faKlfuHNzvTwbBIPUFsrCfDUCNftfCtu5vG8l8XFjgUON22khaYtxjb8q+2CvFxvPl8M2s8KLszcfgUR/YIU5wXXwwTVUgpBJgQnoC7TZrAHMuNRd80NihM/qtZUS6tEnB86009DuSArh9/R1g0rm8qd13GcD3DnH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1kGabnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxVrfjDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1kGabnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxVrfjDS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B6xLv13185132
	for <soc@lists.linux.dev>; Sat, 11 Jul 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=; b=p1kGabnZrUBJ2hlY
	yuorghfaDblqSdhiYlm7ctULfYW560j+L7l7+iB67vL341qh7nyxHnWQ3vWOf+JZ
	AyL+t/ITqzPyNPIRozB7MX8mEBWt+AvBtzfnRvLVuxL5wutnlAqMyCSiPFm+lHJ4
	5zNPRWE26Tp3vKzWOJ5TYm6fPNn3tnJGEZMYI+XOjqwA1q91QDMG/ygGBWECuMPj
	Z4BKER6Cv7GHz9YukZfOSC6BM2F8AATDw/MGHYxikN133urbTv+AIvifq6YwvJrc
	1nnbg79iFo9Kz57dXBNr1W3jPMJYNz2mSpDjJZtt2iZySZWN1F8lp5ezAH8V+q/X
	PVWFdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr0bp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sat, 11 Jul 2026 07:44:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so17925801cf.1
        for <soc@lists.linux.dev>; Sat, 11 Jul 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783755857; x=1784360657; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=;
        b=jxVrfjDS9KIEpbJVdZkvF/H7nRllebmXwQ9VTFwZ2nHIrgXaBXTLYVrpaB0aaG8S/C
         TC7zzq1zgTtZ8ELP4OXOgR1C1PzfP/y3a1Yq3lg3GpY4b9YOdb4Jk0oaMfQRcPJGRXyF
         6VpdFe1Ht4rUBY+fAuwIN0jTWfC2w45+mAqUzqzrEd/iu3iYpRwNque27/Nwrs7R77iw
         66LizJttkDowCG+t9weQoKrqFL2QJO33DgXNlFAoTbGY87rNI/OqQBUcwwapMmhCyuKX
         +iomeeN79kYnFmIq1cF99Wj+3Tt8mMv2FpGwTvqOUpQdvBU9Oa5MlGpl7RIlO6qdKlqZ
         Dhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755857; x=1784360657;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=;
        b=RhOtJlQIKBJqwX0Ti/UKEiVsHuYMGIfjiZjbFFbb7BLrbV5HRGrtPhJKQ6nGcZgh4a
         xBXBI/XppipvlRMpbFshjNAj4jRm+Rti/cKd2p7U4gpGWK3GS6141Z0KODFCyxby8Z8U
         bUw/G/odPTOoFLo35tuTEmpPKfvvMC6t98lnYeBWM28862pMs1oA8hpJ9UdSo1QVBLDm
         /Ctcmz2dre1bq5LDjL9EWtFwokHPYVxZLXioVCdxC1kUCsr+CtbIGqgIUegRPoCpoeHf
         aZLQN5G7KoD2mx1xYIh6uAeaXdwzYrHVOFASyp1fXSwp7hkjOeVNPiwfaINqt2cdBJ7L
         QFgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbrH0jF7zyG/3cc/h2joLIBXHWXH7M8iUBRXi4DQepAllL3c4PYuTHS3UzPcIpAz+HgJo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6b2gJYiMyaLs18+ezLhpMpAtrqFO9OmBj9YtVCVwDjfPeTPc4
	qtWt7uJhJa7MRAZjqUX3nbWac3K+tI+wpifSMfSrmrCy46cB1K4cUgRgEE4HbmmqWNhr6F19nu1
	CJrxc5Cu3BqEWqVdFmMm52jTvk0+F3IyKpojQcykih70kydtd9Azhiuc=
X-Gm-Gg: AfdE7ckk8m9L7rqAOw7c/i2+K44lINwUKOMDyVdUPB2/ZybarrQZi7YlgFRGEYa5I1g
	kZEeVHnD9McN6gvcKlxugRoigBUNPL4iGW4uYVe1Hz6uVgmpG8mEGbxz7Ae6WS0kWSZH2hyYu3n
	1gU/iSFwRr11Yl80fzje6rfSHGirVPzmXEZXfaNv1smwvgLTr5E/JrxwtlQKWI82NekR4tos8K1
	tWfT19Ka+7FkZtVLZANFZPKzjLTnVbCbVAprAzCI9wzOqxhqffUZttkmUfMbtCdc9tlBLF/Y9X7
	7LYdQWSNrtLqZbuiW1YIHq48kGiId6Ql62qgNtvE7leWnEs9furQo9kpimu95D3e7DAPiBbCfvR
	1xHZgwjZS8ZnPEaAM28wEMrN++FTHsIy7wTLEcibA
X-Received: by 2002:a05:622a:1b16:b0:517:7e26:369b with SMTP id d75a77b69052e-51cbf0fa21cmr20914711cf.35.1783755857559;
        Sat, 11 Jul 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1b16:b0:517:7e26:369b with SMTP id d75a77b69052e-51cbf0fa21cmr20914501cf.35.1783755857118;
        Sat, 11 Jul 2026 00:44:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f4f09f89sm171709435e9.10.2026.07.11.00.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 00:44:14 -0700 (PDT)
Message-ID: <bd5541d5-cd5e-4961-bec0-c9550c72ac65@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:44:12 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: st: ste: Correct indentation
To: Linus Walleij <linusw@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDA3MyBTYWx0ZWRfX6MFmjwXkNYM1
 Jg26pISkQJNYG82cOhPLLBP6mXBkZg6ewm/BedY5aCw21KIrSkWrCGVkoHPQkKOqVXE+6HPoHg3
 fOyEiNkuNcw3jCVB5SyuB5qiFYKPJbI=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a51f452 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CB77b5ot5C3TfE58PeUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: pSjrc58jagLhHyYATNeh8xvKjkjNZNvH
X-Proofpoint-ORIG-GUID: pSjrc58jagLhHyYATNeh8xvKjkjNZNvH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDA3MyBTYWx0ZWRfX2z5BPiQkQv3W
 2HpMK3GsaygpRXhyOQmvenXXSGZy/GqQ/0VEdob8tpfT4FNnhfJ4tock1DH6duXxLwH/bbbzYNh
 gl+z4yVryjWI7h0nyKzjxcgAwFUvDMGwIKKiG5UjCSPpCjxCeKCLPafh4eN9xUMhmg1VjXBLM1D
 r8zUz6mEpoUfgIQvss3rdDdOcLzLMOc5zoUaOsQXxy5KYxlNRLHU59E6ZN4X2Z9PJP/phTsV5cP
 wJrUDfnbf1mI/P7aJoQcX7s3wBnG7DmlF9naQaWsfn/t51HXL4n+QqWk+EyavhZ+5GnhjKn+TXy
 S9qach5W3ZUGDX1VvZTiW2uXRQOwT9CkAIF9ZSedUYhRq5vx8ZoVfmc0eItEdYtH42cVTh0BHPw
 9nzZU6E8YDePGfV8ehwWuPmu+pglY2rDpLVwQEpKNhUsIErCZhXEL9zrB4X9X4w67kMjECUEMcV
 bYhnPPDtj7+RuDckILw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110073

On 10/07/2026 20:53, Linus Walleij wrote:
> On Mon, Jul 6, 2026 at 12:18 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
>> No functional impact (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> This patch 2/2 applied to my ux500 tree, thanks!
> 

I think the same time Arnd pulled it into the soc tree.

Best regards,
Krzysztof
