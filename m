Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EDD13A3F7
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377147; cv=none; b=DM/lywGWvlzQruysd2JLbBwFzvlqUgMhLeqEiDDKfeKvi6UnFL7TjPeA6KNGNcMFC+DgHMLB0ww43CvRwhJUFOaJHyRLGL/YOTlTsmR0fuG27NBcGm1jG7a3tXaWstUOAIlvw3GX2Q/zenymqIJE1VQOGqrl00tQxWRp6dIzAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377147; c=relaxed/simple;
	bh=fiNwtJ7wiweBPmwKNFOOFNbYse3cZNE/JC8VuJfVZr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNSw95vrwi7n0tF1ORSvL4bYf/8DI1Ot4fyr7a3MTjRTeWRM4eExgn6WmT5JgIfXnFSSizYSBnQmMDL3Tswc+hjjleObk38/Sk3uq/VcRJXrmmLeL20GsPerV6rK3VSYTTZkYduxzI2dDI66o+x4efn89sUGnqrrMBlmgkJedRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRAhzWXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBsXF+ec; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRAhzWXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBsXF+ec"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LERkk72447007
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7275bNqXcJ16wSLEQYFTe8fF465m1Mn+HIb1hm/nRZ8=; b=HRAhzWXEU/H7jVTN
	MtmG3ClIh0FQZcH0MEQMiv1psF0V8sFCip5Ya3leHY2qum2RU7B3QuI1IjzJD3W4
	aXphinIk2uQ8f9a75SWZVpyHLx0kxgwiApJu2XqXvTwSSPZWEqLnug6UR37Qu3I3
	ZCsQpy9I2om77tDLvH47Tnp/leD6XUjwYHr1dIrqwI6+c2Gp8EJek28K+vUrfZgB
	RHW9izdv7kzMZO2atfPULFCpuXSm+8TsSYXcXkbddYQpbFpZ/lw8uFXI3iLKGuLB
	Gf2Fa60yKhjMavW6J68scKLbI8nL1scODNR3X5Db1IFpPH8vbtLohS0tU7vr3Fr/
	pGZHLA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7r8yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:25:44 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575507a346fso8404340e0c.3
        for <soc@lists.linux.dev>; Thu, 21 May 2026 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779377144; x=1779981944; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7275bNqXcJ16wSLEQYFTe8fF465m1Mn+HIb1hm/nRZ8=;
        b=GBsXF+ecABJxjcI21x9WjRFbURCcoKl0HEGhT/3uoPeIoflBrCZbMSMj2Z8V9b+5QY
         8QNk8B61TfIvkfOwnDbn0Y1D93GU9EI0gKF2DX4h2u8mWDcuzIjBg1FzzisMThZsw/aw
         3cp4qbhg6iwAQa1F5Gg71kX873XT0gu24H5YIMRtJh14kMkeIdMdHSv4HvZvCgvnP9KC
         OBCEQA6zHXpTfI7qkMtSDdpZIRY78SoAmuTHYDwvpekD+ZBbJqpf/uyTltKQXNjNzH39
         hnEpaJ8S63QL1O8dgdFYpYK9tv5GfV3Hig7Tzo5WMvxdE3x/36PT8EvrjrpLT90QrzRe
         N30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377144; x=1779981944;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7275bNqXcJ16wSLEQYFTe8fF465m1Mn+HIb1hm/nRZ8=;
        b=GC8GzdXdKqMYJa+ybCCCQdoZkS/pRSkLPKmPRvFiUUWHr464NO3p9bgmAefJE6WyeP
         7nomFX2FEFzlGWKJwyiHYDTA/G2Qa+vLqYSmiLbQZK4JGr/GgCytT9M8k10TX/jl5rHr
         7RpmoW6ngO7SlFfFyZpYDd6/esBUQfUixQRgAtj5n4y33g21EQB4i38R3WDz2rNVNPee
         e2tK9iLpjl+9jT3hawZRM5SQBxRBMz+h/eNlG55pVb9lITzFjKi9L8Jig9TSdZ5OP5IB
         IF7/nN3MBViQCZSVYdrPzKD7E8S6ZlMJ9nC/u/1/kpXps2R8ZwuH1SpBN+pgnUouYWNZ
         cnPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6ClBET13DNxok+x3oZZrINzAT7ZhhWDFE5uxcSCDIziLdQmGKa+DM1IxFa0ERBMCn0v8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTaAigF+0RS/wBQDjoKgodI2Gvi6OcWiTbpk9cVeW+oXqDheGr
	dPIpklrgT2nyKurzTad9OVYS4XM/VfJ4QjLrIEv6+un+gVSG5vOPyB82451Dcps/0b40XBGcgFd
	4JTF7rbbfmdNfTU8C/ZBLZyHxzlfVp0YYXk9mPuK5/mVzpcOpVRYOKEk=
X-Gm-Gg: Acq92OFiQ9hZF3AgQPGi17I9LNC1bEXMnuKvn05PLWpSzjs0UQj10mJ7HBtMJtO2cJ+
	kYheSy5d9cNIQtdrlSlcdAQUyKvrcTXt/i8c+6e45bNMx7tOvF4yAzzB9QfrKGeOh98PnEiMh5M
	jWreH5FSxHUPPvHKcj/1P5+b4RI2wKb7KA+d9YskEHRmgVII+zi3+0oITOrPKxDFAUmMmePtL6k
	ZCtih6xcl+DFzJkl/k/ucqdjNSXIfrMfZgU1QY3siAXAafPb6tCgQBrw79N9itxE5k64MuINLIY
	1OC3IGtkziPdqRniCNPg5CQqHJzIMtCZgTiPoOa7I4eTFuApqYix+opcykssZeC3gLBVotYFSPx
	Qrj7SVsJUOJB/97jfNrMZKkBBs9xtZ1NQDFs/iBakaAy7Vt9/
X-Received: by 2002:a05:6102:571b:b0:660:d5b8:899a with SMTP id ada2fe7eead31-6738c8c92d0mr2626287137.5.1779377143867;
        Thu, 21 May 2026 08:25:43 -0700 (PDT)
X-Received: by 2002:a05:6102:571b:b0:660:d5b8:899a with SMTP id ada2fe7eead31-6738c8c92d0mr2626225137.5.1779377143408;
        Thu, 21 May 2026 08:25:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d52c8bsm78386875e9.8.2026.05.21.08.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:25:42 -0700 (PDT)
Message-ID: <b83ef885-3d29-4e46-917f-26bb8490fe35@oss.qualcomm.com>
Date: Thu, 21 May 2026 17:25:41 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Drop non-existing (yet) PCI_SKY1_HOST
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Peter Chen <peter.chen@cixtech.com>
References: <20260521152158.425895-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260521152158.425895-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a0f23f8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=KaF378oVaPLUFMQH0kEA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: NWNDtiu45X9DnBJPA_x8UjacBuf6SwwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NCBTYWx0ZWRfX+X6AB5wwfR81
 6LMs+FKBepM7DeDSpofRmEilaL+vnIiXFeLZ5IERpmueIIaePix9axj70pa240mXuzJeu7+ErXf
 IrQX36Flh/ebdoyQ0UVOtGFVrgdx7hg2jv9FPqBDvhfDERbt2qGbmrKMy9P+mnSbHJKk9IGiwpf
 Rflnerih7TKzeWrZ3K1xsa894uzTyNKPAxca/VXTj83blDnSmmUS+3OlL1hajvReSV+mhIf/lNx
 dGpVxft9fMB+Ga3LV02R1MSLwOj7hy2k7fnwS6E+iex1ALkWq2cNXRtGwv5fc93GoI9m/U+mSKT
 cZSTeHgIO+mggAt9bNnqS4SSkmZuNXc3qCl2RIq/Ne/XjgmM9NopkB+mIphaHFw7AJ38+Zf+WhZ
 K43nxeF4cTh7VJKjkMpisT7RFJRReYCq/oL6Djf1HLVvCcUzG5HQQzzu887qCAbaIRWwrqQtW5H
 dyBIavTzw+mLF8DlXdA==
X-Proofpoint-ORIG-GUID: NWNDtiu45X9DnBJPA_x8UjacBuf6SwwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210154

On 21/05/2026 17:21, Krzysztof Kozlowski wrote:
> The source patch for commit f54f7979ff88 ("arm64: defconfig: Move
> entries to match savedefconfig") included reorganizing around
> PCI_SKY1_HOST, which is only in next at that time and was not merged to
> soc tree.  Applying that patch caused some conflicts which were not
> really resolved correctly and PCI_SKY1_HOST was added.
> 
> Cc: Peter Chen <peter.chen@cixtech.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> This should go to soc/defconfig branch.
> 
> The PCI_SKY1_HOST will come later with:
> https://lore.kernel.org/all/20260327114628.3800886-1-peter.chen@cixtech.com/
> ---
>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 094bb9cd8764..4ed684efbbba 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -232,7 +232,6 @@ CONFIG_PCIE_XILINX=y
>  CONFIG_PCIE_XILINX_DMA_PL=y
>  CONFIG_PCIE_XILINX_NWL=y
>  CONFIG_PCIE_XILINX_CPM=y
> -CONFIG_PCI_SKY1_HOST=m
>  CONFIG_PCI_J721E_HOST=m
>  CONFIG_PCI_IMX6_HOST=y

Heh, I see the Cix patch was already merged, so this is wrong :/

Best regards,
Krzysztof
