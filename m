Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B310259CA9
	for <soc@lists.linux.dev>; Mon, 30 Mar 2026 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857739; cv=none; b=EcDtGMJc0/4FqV1nXnPaOva2i7zhu1HEblfK83nkMQk922/mRAvPVdEoQS1LSwB6eZcfcXD1Bp05ead0ZNPVlY95em31LyW+S0BWwIYwpOKj3SIn76q/b+z17CYazREYf1E+zmEo8Us9j4h+Wuy0uPg93wD7fzlTcOeg6x9ReRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857739; c=relaxed/simple;
	bh=u5OPZFw6uTewcCwEAP3MO5eNUtHgT7VXCa4HLqbTtDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpEBewDX9XXdMvXcxxO/mBGAmf8avKidnP5/gzLoJT8UgEHwUmwlSigX3Lh7jmWviSTQhyT06tEBI93b0IktAKJ7a9OzUSd7eh4Qbv+TdX9iPHGGyHOXneeOIII6/fUkFAGUeP0mh9gvvPsitglkyntYTIk3yKitAVB5Ji8BuZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZV/YVhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3mDZeJT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZV/YVhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3mDZeJT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7AoBf2055784
	for <soc@lists.linux.dev>; Mon, 30 Mar 2026 08:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=; b=lZV/YVhjVeXylJ8p
	rmaXgDctrQdalH984eJNIp9N2rSOWVaN5XXh5Bnr3XHhyJIsCqDUuTm2j67iC806
	Hf1yUoSbruXVRDbSG6WYX6fT6GmIDy7F4InwPMBnBbhofUOojjR+7Qy5YSHIR83s
	gD+q1bzb3yjQC7cp/oroFPjDC+TnQBkFPOOyl5lQyy5fooDErRVOMCvrczS5RWcx
	bZLOqjHqQ0aYP8TSW8Dvh+WTrYU6z5bjv9KaSHpOu94Q37DguVbQSVYi7KUdKMR2
	kU/f5QmKl4vj8LzhTugLvpl1RT4jFKLoKxfYQ3y616z9aeTkZnwkgKGoFuZZsanS
	9ATiow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7d3um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Mon, 30 Mar 2026 08:02:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so122104871cf.1
        for <soc@lists.linux.dev>; Mon, 30 Mar 2026 01:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774857737; x=1775462537; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=;
        b=Y3mDZeJTtNFPFHTBCdNTmRXQEp0M83HyZHVUhSlJMrPxf1paZhqJLNw9qZdyJRNo8u
         YQdL927dMA3PeZ2N/Aj3IqHxgpgSMsABSoPB4+6QSexnsN58X6UJOU1P5XzIFyKgf3Zt
         DFU/C7Bp/f+XMVmZxg2UTw94eBHq2WjWyQtamoS9yQCspzXXQ6HQtW/7W9+50CJFbbzu
         8aS2NqjTgLth6CFm2o+7+uxrLxmVrwIK7PufByfg9f1imp2+WwAIx/o1BTr6bJu+WkwT
         pm2DxOQmpxvyBhO9fJEaDWW7l3OBOIn+9Uc8+E1qHdJ1v0S4/QA95h2HLf27EI8l5YvT
         agDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857737; x=1775462537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDTSMOGlUSoGnSk55MnV014+n+c+NRgq7zKWtSmXJMw=;
        b=MsNp3Ijoja/25b92dCg6+aMMs72PbXh0KIQIUV1UvPdBbdSV3raoTT+wpe51B8oQa/
         vCShJgJljTwj0U4RZLKukwncGZxSsPrRqHKtnODzmayNv2c2sUFGiGs90nPgDdJjOSTH
         ifmwgXxVLSTbLMyjufKlb2AkVJ4Dl0psIehas5Gxzz1Bxn+GDt9Cr+7uAoM9d74NLuep
         KoKb+KTh5O1RjPDfsYyhk82RcUrG/CyoL4kW5YALmmJEEGAmFwRCDd3euL2mgFbAqApT
         d410LXsR0iIh3di9y0BPo46dCzIRd2xkQqZfPtl6Vd7Mcpx8uLTx6cEdUhgaLM8cN37X
         Zzmw==
X-Forwarded-Encrypted: i=1; AJvYcCUfN9CVM9J5yyo+jUKTGHaLwmOjcUByQeHtMldaN3v+uLWc8rS5x3vVpMHMK5z8Q+L3kIM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyB/AmX8HZTffZYpY202CnRt/iM2P7bPDiJbs6lbTer2eEXkAHj
	AeycK1wU4q/X5/OvkdoT9vY8Of3GCIFuHpAnH/SfSIr52JuBJwdnvA/W+iD9ft0whCkVOPOiLoF
	FEJUgSmoYF+YY+rHcE4fTnatsD+jEeGgRCawzP12ujXgU1Ga2UGO634s=
X-Gm-Gg: ATEYQzyYzOfQGJGoRg+IPPAexfsVYvOikCqcoT014qQuH8WSpZKMbwh1kApJpL+MV+9
	im0tlVA8dT5yo6XhaUPXw1YytYWAqzn/l0BRbsaPx0zzgKdcpfERak7Aau7D0CDMpeS+DBu8ZfK
	zVMHOTD0xP2u9FE2Z9M2ATUe/xfjVBwV6bL3nNC++P71dgaOsltclwgxiLn5jKfEpmqkHIHT27z
	mcC3CUWNp0+Suj43OGhQU7Cn0PQ9VIAB+hmxexkfTrfd2tXzGNzvobG+aGgefN/GQXDYkGs7ha6
	vAS1Zvg6RA8uXdxzveBExa1zAyAh2uI4glqG3Crcn1FQrIV3Yvqg9ykEYWOWk0p4YOGKaUS0vtw
	YwMC90ktiOQASXrwZqGTlngENMrNvW47YS4b4wRUhNJDFDZqDqe6HBqEtsaFOklDKksrbFaby09
	ci2AmuwYgK
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr152131321cf.30.1774857736821;
        Mon, 30 Mar 2026 01:02:16 -0700 (PDT)
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr152131051cf.30.1774857736352;
        Mon, 30 Mar 2026 01:02:16 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:1675:c176:3ec0:ea8b? ([2a05:6e02:1041:c10:1675:c176:3ec0:ea8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873068858bsm153678045e9.9.2026.03.30.01.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:02:15 -0700 (PDT)
Message-ID: <6391971a-46bd-4ca2-b629-be0b02e48481@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:02:14 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: st,thermal-spear1340:
 convert to dtschema
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org,
        conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        soc@lists.linux.dev, daniel.baluta@nxp.com, simona.toaca@nxp.com,
        d-gole@ti.com, m-chawdhry@ti.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
 <20260329123449.309814-2-krishnagopi487@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260329123449.309814-2-krishnagopi487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69ca2e09 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=a0Vft8LJKfaWkH7qTSoA:9 a=QEXdDO2ut3YA:10 a=nnjH-3LFHp4A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: orDimnVSxyablrkmq1XTQI9DnnT4linZ
X-Proofpoint-ORIG-GUID: orDimnVSxyablrkmq1XTQI9DnnT4linZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MiBTYWx0ZWRfX2Vft+sOnBjcg
 oHTDsz5yz9uJEJtuT09mXKt22MzGh7bh9FB1b5JIrfiwwMUltHSngcdzyMAZFuHYWF+jsUGQOH6
 A6LrrwDYJsa2m2sLHZLHiQHVZjmYQWJdRP4GS6Wh4BrafDtwkuCle3pYL10KyxEohIGnB7rGcUL
 tbrc8xgx/tVzVEUeIdRM0Crql7CKetNzA5Pcpa20yWLO5vG2zJmpHIe/fNoqHxIsKMNEjc8rFL5
 mEgv5fciFDDNaLNjwloI1MEYKQVIlqdGP+1T/WE4plpniQbf0Qmsd2oISFjOz45s8ufOPQ4/xYT
 7xe00VgFaqNBnNVe88K9D17vAMBa1+j7qw3tp9DYx//KPtIuGcmlwnhKFMdYlA+jN/XAq3k+A/O
 nhQv+BDI+IW6dyQ4nMjz5vXHCNMDsaeXGylO71tNjL5MYUqsWOFJH8viru0GnQd22HgKwcU6py0
 qFsztP/3dcE4ef42QLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300062

On 3/29/26 14:34, Gopi Krishna Menon wrote:
> Convert the SPEAr Thermal Sensor bindings to DT schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>

Applied patch 1/2,

Thanks
