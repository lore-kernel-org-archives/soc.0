Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB2836BCD7
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377473; cv=none; b=IbY0lCxK9d37/KuOu4NuU3uVsSaK7iGiEEJYqunCrQZYocqj5swr+6UWtZL1rcHgMA3qYoxwRnxS1hgWjb6W94MKO8HMxeeNKJ/JzBEXcx2YeeolIl/si7NG0LBQ9bvnyNNz6/wMe3mqYeia7Lem2uBh4652/vaSXWkzKorR7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377473; c=relaxed/simple;
	bh=6VIYDBH4yS45xRWhJCYezI+a0XLuknE61acQIeIntj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBkOgyFnrkeO0UZhfQ5kOh5QF+yotlq3696plr6t5OgWfA64U5XLjGfMlJJ134HSF+ZpRZke6Mh/KypQxsRWozJzo+/x0km1cdc4nMCHzWEKMcLOf33jkCneB1ImJdsP/rerO+UF11QYY6SgqK+itli3I7yroJK2JpI8d4QkJ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lL3MIstS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2zZDLcF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lL3MIstS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2zZDLcF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LF4GUg3556033
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bo2Vb5ykupcYisnD7XCsxRkshRZVeBimw4l3DMckC+A=; b=lL3MIstSs8L++Vwt
	48TyqcsjylOatfqmJ1fmwliC3NqTzF1YvqzWvhbTrjEo4xKnkxnMLfKGTHlm+ljc
	0Qwuk5QTKPyF+j7Ko2K/NnopTSVsn/MMvfxZAHramz6Jm3H5uxsBLvN4hnMTuM4v
	QWVDWr7zq601Zh4RbPJgInJDk8bK84FSjLV5SbrpeGVMx2hlFZX0d46NbhZ36AiA
	mslLcE9K1CG9++bZec/p6jDkRo/JhXE9/cPZjmBug7Ub2sisAvEssGg/ZPJI2GFH
	1iHR2p7Yc4yDVyDEtiMCAltzuwL0MDFPlG9yO/llAOxjZjl1K+YLNFdzgF0jJcrn
	kibGKg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6n9ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Thu, 21 May 2026 15:31:11 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4854367b399so458487b6e.1
        for <soc@lists.linux.dev>; Thu, 21 May 2026 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779377471; x=1779982271; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo2Vb5ykupcYisnD7XCsxRkshRZVeBimw4l3DMckC+A=;
        b=T2zZDLcF7EHOirtqRIuBAMbFC3MTlvtQhq0m+TWl1py52cpVm+1ollQwdd/4WD56rJ
         kBPCFcqQceNUvYUQOLszj2fEYGSJ3OcFUXhs25LQdHTWcIkxwAXEv9CsBdaj1hdmdQzW
         8hXjoVKkWicZLJOZk5fg5ZFGOCXzV58cR8ZlsaJbWZYwi1X6aMvk1eSqSZjnmchlk/t9
         rcmB7Vf10m6O+moZJDwijP+WlBhc8RZj42BfdTIkRWv16ZaiD7/Cxkzu3BfybihVQh2f
         GwYgcKzXujJiAEszUHWWEcpS8BJ42r+QMpOz6WqfZSRnaC8sUWJBwDu0JRTqUfTDs/AK
         MgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377471; x=1779982271;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo2Vb5ykupcYisnD7XCsxRkshRZVeBimw4l3DMckC+A=;
        b=P66STaHXEc7Z/7IGtQLCKMNZBJbfcucowr1QuWW2DBbcbe6hx1COy7dVrZcP4medzz
         PmYxaBcFWRdOZHcDLlx9AXKtnYkVUi8BX+abpdk3NXh8o91uXeqpEVcB4K9Oq7MFTOyM
         8liI/pUX3ZISUMAOq+1KhpvL+rH+3ymlA8GDiAG/ynfS1IJSXYxZF0RkmKw7OY8IFOhV
         ULOlOq54N12i16bE0pq90CKsObQ+5onsjJTap1E733zipNrLQr5nS80e2Jp1Jhsv7q6E
         5snHVdTUHZpwatbau5/Zfu9EZNcP6ZjOlasZrL1kwNUN60iDitPsUl1qDBT4B1NvoWyy
         GjDw==
X-Forwarded-Encrypted: i=1; AFNElJ+IzeBGH7uJQWWEYhyJfqZd7UQW60s925p89AGOoqBC9a9ZECcxgA16bHu9XmTbuHuU1U0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb5/5b/cXmSCN+GaH/IOILA/KpzXuS15qfyCS45UEBi5iBNukR
	EA+6WO9EDufD6aQuzUQCTodCxVI6mLQVnVcKVPrO3CACKpQQ3Hz3r3TdOs8a2LJhQOWx9C0Auz1
	dZlDVvHQvjP3ub5Gk+sZTrVgh0S/BQd8dV017ZpAo6rYWlH20pbaX7iU=
X-Gm-Gg: Acq92OEd/TVA8KCJtOcz2BWCe/FEic6RurMhVe2MQawu3+wMwIlhou+1fCe0LVfItTs
	Nszsp9KIfdDO3RYZ6mn/XQi4OyrJRFpl5nOTCo5YS0zHVkITtsr5xdY08UKWNPSUpQEwudcYGvb
	dhgFtIt7VEXbrbUl2Vj6Un7Zrc4w6yBy6Mjk425Slm24wncbW112CZPQhpi9T95a8oigJqGelf2
	6m6BBr0O3LLdyvtyIPuG7NaSyOVVpwE1YkDdtxWozy/T637NAsrJYJSohjoP6HZ5FBrOY19iLhK
	k4SLeScyt+EIpLjowzqbC15o559VtALGwhi2y6n4+msEJd601FaMZGHSpHlSXZ7Gqzp9/ZgbdlV
	bbsrSMgObroupriJ8ebZw1gfSRtiq2eEne+6HHzYC7O2EoX/H
X-Received: by 2002:a05:6808:c1e2:b0:485:4179:aae3 with SMTP id 5614622812f47-4854179c558mr855017b6e.43.1779377471001;
        Thu, 21 May 2026 08:31:11 -0700 (PDT)
X-Received: by 2002:a05:6808:c1e2:b0:485:4179:aae3 with SMTP id 5614622812f47-4854179c558mr854969b6e.43.1779377470497;
        Thu, 21 May 2026 08:31:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm78868505e9.13.2026.05.21.08.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:31:09 -0700 (PDT)
Message-ID: <0e6a21e3-5359-4ca4-8bdc-7409b528b9e0@oss.qualcomm.com>
Date: Thu, 21 May 2026 17:31:08 +0200
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
 <b83ef885-3d29-4e46-917f-26bb8490fe35@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <b83ef885-3d29-4e46-917f-26bb8490fe35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0f253f cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=5ib9d8KPHpSnOhPDGK0A:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-ORIG-GUID: LRC8Ae9_EhSbSt6PUrjkedmx87Pq2_SG
X-Proofpoint-GUID: LRC8Ae9_EhSbSt6PUrjkedmx87Pq2_SG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NSBTYWx0ZWRfX9z1NjJwpOhmf
 cfofT59HDV/IjeUwLqPkDI9qj8piHbQ8VPsbskLV9IIVYpOUJcRM90wMSbMe4YMEAYilXv4fjWU
 I7bT/dMQEXqBQplPZqLReOeIaQbFEzE2AqXTLJTKUO+uvhmNTI7rJAMx51kqjLLCvUpmTsE60j0
 1kWxnDJSeEX24wYyYQCYHcooFa4ZNnaFi8+/fDFrtXt7i9dHDvZUs9VlXxzM29R5oaJIdP7FZxY
 a4FigHbIo/6TFF2UenojsqmpenYtl0zqBfuQlGihLYD9NjseKhZmiqfJ0hfs1kz933xINIYk/Vm
 4UPJ9gxqkzwl0kLyGZs+tzjCvt9zjZHC8VC26sZ4Dnl0NXyBykE3KfiCtc4U/Qjkfj0VyWWqc+h
 khLrnjUzcIVNKcpGF9hmFiyNlQfuQJqljWnQpV15zRCHU6RiKJREG9uCkusuXj5L1jPlLV6MIiI
 wICKdXml/SZARfrTXpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210155

On 21/05/2026 17:25, Krzysztof Kozlowski wrote:
> On 21/05/2026 17:21, Krzysztof Kozlowski wrote:
>> The source patch for commit f54f7979ff88 ("arm64: defconfig: Move
>> entries to match savedefconfig") included reorganizing around
>> PCI_SKY1_HOST, which is only in next at that time and was not merged to
>> soc tree.  Applying that patch caused some conflicts which were not
>> really resolved correctly and PCI_SKY1_HOST was added.
>>
>> Cc: Peter Chen <peter.chen@cixtech.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> This should go to soc/defconfig branch.
>>
>> The PCI_SKY1_HOST will come later with:
>> https://lore.kernel.org/all/20260327114628.3800886-1-peter.chen@cixtech.com/
>> ---
>>  arch/arm64/configs/defconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 094bb9cd8764..4ed684efbbba 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -232,7 +232,6 @@ CONFIG_PCIE_XILINX=y
>>  CONFIG_PCIE_XILINX_DMA_PL=y
>>  CONFIG_PCIE_XILINX_NWL=y
>>  CONFIG_PCIE_XILINX_CPM=y
>> -CONFIG_PCI_SKY1_HOST=m
>>  CONFIG_PCI_J721E_HOST=m
>>  CONFIG_PCI_IMX6_HOST=y
> 
> Heh, I see the Cix patch was already merged, so this is wrong :/

I sent correct fix in:
https://lore.kernel.org/r/20260521153003.429610-2-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof
