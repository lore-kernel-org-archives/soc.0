Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793724989;
	b=Q67D93Drk+8jfLW/Nk0kA4H5b4wE1ntzapWvw/OxMQ0xvBnNO71t+MYrKXImvPIswxVh
	 S0mPzzyYwXZC7jCvmWAVA+jZ31Mgse4Aoe+78LY+uoEdn80eHxtLzmWJK1VCMnN22F/I/
	 fiAK9/pBCWeFYdtJjaUz34bt5R7l9+0kJfBr4EKNkvBrNzgUV1Y81CGwQzip4z1ox+QkU
	 zu1aOZL8mUFsUBK3cE4QPvviUhshERH8XYTwRXf2AXB5sqctc6RmbwDEGZCUZ26Jh3O8m
	 EreDdo1F4UpkXVHHaRKN9PgkYlMrQQkWvmH4z/qwQWokEueU2FnP8HnKaPQKFSdIXNg==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724989;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:
	 List-Id:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dm3rdwy2/Ac1iK+XGuzeKvVbtJpnFa9K6TK3V2Q/28U=;
	b=2/HsuFJ1eMoUK/LBADiF1/VpzMWMY798EGfs4Th8XP02cTxZZg7KsvJwUlde562uSJ2G
	 2QVxvKvpOKF6wmP1KLFmIeYqQZLD4IfBZYpd0GGu5POd85e9ts9p55En5ug+Cluadpjhv
	 Olkar+eCaWkJNMIrR0RiIyUk9zQKO1WcJSoyx7wdNhkIkwc+VSu6IUQkHHHLIcMAtUiL2
	 LBzdinEDiOOSjHFMe2P30H39kams7lAZdqAngbHJKWw6izkIIrqlxJcCbP2i9jZ7qRPPo
	 etal8qJp2D6bODJcTZmsUv9tfp+80rmYebXFtXe0Uky9Qo+OqLhV/4QhIksgJc78kUA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owNDNq3O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADoLK9om;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D975C606A327
	for <soc@lists.linux.dev>; Tue,  3 Nov 2026 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owNDNq3O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADoLK9om
Received: by smtp.kernel.org (Postfix)
	id 9BC001F0093A; Tue,  3 Nov 2026 16:56:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793724988;
	b=mhw8OCdDqTOQ0+W7yiXk/aqdOGKqUQQfRivHRPFs7F9kVNK/NhMUB/Ile+gdGF95D4K2
	 Ny4jpBrSHQLtrrS8tBSvt9RqaLJ1M8x4PBxPr5LnDSzX84LG04VssmqJuRSrATutXfhfg
	 oXYoXg2+doKddw8nEuSLh0l+bvbb6BtoHkbilk5ANhYuobmHWa8VscUl6+EvSppuNseMW
	 WgFSdrWDV9yUEo8h5/zBTB0npsuWGZiw5LMk72YtU7lhGSXM0tZntGrYSB8Ey89d3T/XM
	 6dV9iewMswgzV9rYKrei2vGUCSqVCUUX3sgpxHWm0taU9KAumZUE1tXPEx1bI2ZyBYQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793724988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:List-Id:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dm3rdwy2/Ac1iK+XGuzeKvVbtJpnFa9K6TK3V2Q/28U=;
	b=uckrg5T0ARMM77gVgq8feQ2xeqWRQjZMd6cfIR308jroKmawrI2cQem75L2NjkYoyONh
	 4+lRT6V69fyzAuUtHsnIJLhybQysOLmjoijnXju1kupVBwlzZczYqfQjr5IxOHXrjJ0Jh
	 W9BF1gnOmNm3GB6FnF74PbKz6hvrkqXmM5C3gXSY8uXD3cBYxjoLLzzDjQBSdvID7WsGr
	 nGNU0bykWbnKwAg2fZy+e2nT10vNsr0q3lyAlYSU6owAJrmkVajPROx2EmtQSjXPWXAZG
	 WaaXjXqtvPHcw5Yj3TtkQQT15kZWbh4I+5QkxhZGyafd9cIid0bscCcXly/PGNrCvGA==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owNDNq3O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADoLK9om;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83BE81F000C1
	for <soc@kernel.org>; Tue,  3 Nov 2026 16:56:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owNDNq3O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADoLK9om
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 83BE81F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAW0i3690386
	for <soc@kernel.org>; Tue, 3 Nov 2026 16:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dm3rdwy2/Ac1iK+XGuzeKvVbtJpnFa9K6TK3V2Q/28U=; b=owNDNq3OoPWyAVGR
	jEqRjYZpe0CTP+OioWaaAvCFE0Qpn322PmugEdRnRfzerwe2fOdi+CgI7lhwpb/y
	vCLhI9nCsus0cwLmV4HMk0/ve07U85AYazYPIY5L5MNeGfIPpgw/lx2BVhpe7ujL
	LlN6OZQtvjTM1Icgij78JBI5OQXWC7JSEJOHVFOO5lmGrW6aaCd+3N92vrEs9EcT
	AwAjtHLvK+Gjz/x8Qa0ENkyOlkky6EAF3N9DTOOui22L4PY35JD7H6IBMsdBSwi3
	T5YsO6XPRrEZoQPg9wZeJqXnnAEtmbNwlOgvs8CqyrdmVo3dVrMVu+CN7CM6vWlp
	IP0uQg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9bbss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Tue, 03 Nov 2026 16:56:26 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d978e4faso64905947b3.0
        for <soc@kernel.org>; Tue, 03 Nov 2026 08:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793724986; cv=none;
        d=google.com; s=arc-20260327;
        b=XyV3Sn1UWv1P2jXlwOgrBspJw5MKXt4AP/ZTSg4Rf1avFn/ToZH576G7vtGPFJYyPj
         O4DYc1hEe6seCIvtWN9QP73fPv4/rZfzA1AIYOUW5iqZ0x8arBl0d7LblYxAA2pgmwVI
         L5/V5aNnvgt1lYggHqRnABl8YrI+aRBePpAFw7dVshX6Xyq32owAezN0YK/4q0MlXG9T
         /OfJ+SOPtxObbESkRP/IXF+qpPrJv9nTAHtXoX5XsaH56jxaUKTOjJzRQTMtmMQBu7Xg
         zLeK2Akdkt7QaEusZuDjiMqLe7T6KPafo5YB9Sbrpcpf16RVKYKaUWIZdTYSnXvZZK3b
         rM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dm3rdwy2/Ac1iK+XGuzeKvVbtJpnFa9K6TK3V2Q/28U=;
        fh=1rJBp/ufgcpDpidp8Ag9nNy+3pUXIC+zQuaj1mlwIEo=;
        b=HksXhIOAFTOfEDbXmbnyp7/PrN2Jawoqdxu1ODZRn/JFwP47r9FiaxiYInwoGY8AVA
         A/52On/pRe67NkKy+AltEg1263C6xArfjdtNXNB3OvWGX3SfTeajN/ybq6pSoJuKQcZR
         S9AYpq6QTPfsP9dwgbWH1B/7aj73srwdnZEmKz+dFN80F58ijKDKWHer3FN6SUWzg5KL
         qm5zQQlvmXuIiUrWDVlAc4uPEEtiTrnw9bBxogcyNO7RBGaNwuhWPqjxI51w4IFumY91
         B5DlpvOZ2ZQdepzOPFQEFWUKP1pcwVkAhYhyXDeTi7oRsZ0UxqUsiuXCqzffLY+VXrkK
         fcTg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793724986; x=1794329786; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dm3rdwy2/Ac1iK+XGuzeKvVbtJpnFa9K6TK3V2Q/28U=;
        b=ADoLK9om/bPTgWXq52O/vDJVm3Ti+G6C35vbImY5OgxG33X3DFH5U9YNlnR0KrLdAg
         b1/aj9vVkU8vSj/+U6919rA17zTE4hc7n6a4Lho3Quk+KZiwffIOLOqGOpwxcTVdUqcf
         YxZ8NTmYT33IIAZzmdTNUM+4wgSfTLM7RbY0shs+D9s2lODqG+6+KRpLmS3wn+2ICCfF
         9RA5NrfYrUIAWVCoxqxgOf6EnBmuzKxElsizCH8Ey7Bi9U2AwNNjAtTo94ulAD1NTwPr
         +9fW5vlJul2EJqhZeWh4Nfa3NOx6+3WYBJ2Cs5wh+ChktogQBx8ce9fAhlx+AQ9QJYWa
         lxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724986; x=1794329786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dm3rdwy2/Ac1iK+XGuzeKvVbtJpnFa9K6TK3V2Q/28U=;
        b=M10BmA/wME/rv+zImBn8POaz2JxrM3ifF5/J749NrQ2WV65QnF7SaPXjKzr5ZkdraB
         fm7U+bziXPcxrhm/YS00NQ18cuJe7oMZXYUMPZa+z0clfKjzxW1LxRf+AKx1Xxw9WgNM
         OsL9gZhMlEo2bHB+nNME2qJUG3KDlHy93O37teA35xFlQgHosDbLnSQ3yYIQyiRHgo4t
         DnCl2ivnBP+8z+pEqX6wtYEkXvbCw1Qo0GmQWdOWTKEgQJEng0y2wp7dJIZUdFg+Ti89
         2Ac0htAFlmHgnHVE8y9Ou9Oa4ZWXv2ALp4HE4otfJRj1Ldy6sk1sKErP2b/nx2xruMwI
         fQjA==
X-Gm-Message-State: APuU4Z8uPMsJ61e13jZ5GCvTNbDlmqc6Q8IwRnPdTpFYeZQvMYJWYRse
	1CK9XU8akinznRYTUS/8VCgTi79xpVKW/gzObuOD+BRJ0BC5IPbR7FxBICG9Abum+YrTQxo7rEe
	ZV71aSQQMpNO6ZMQh4nldpdYRjK+7O/s6v12pqpqmJ0Ts334aKwjCqC2pkcf7lHbZKDALimVxar
	gaRF845EXoU0TH08zqONT1IsU=
X-Gm-Gg: AYBFou2avYJU896jemGf3fFSbQ82BPL6KOijTGrQwYt9RJIMGLfwS/TF+ZiOzpyja50
	DMQP4ShQDL0mSknnFqagX2ajX5LqxMh4Ak0hjLLpqIGTa5ufzj0MEI/4w+4mDAUejvesk5vDpTt
	SifXaWhl5KoWQxqkv6Fylg8qIcyL3G1x5wO0SXCDC/Lm2znRltbU1ySBKK0DmS4zs/F1tMpzV45
	vQrlxbQiPnBlEHyLAbaJb8YD1pktjBEt5UFEZC5
X-Received: by 2002:a05:690e:400b:b0:67b:aa7f:a5e3 with SMTP id 956f58d0204a3-67baa7fa732mr10257340d50.2.1793724985815;
        Tue, 03 Nov 2026 08:56:25 -0800 (PST)
X-Received: by 2002:a05:690e:400b:b0:67b:aa7f:a5e3 with SMTP id
 956f58d0204a3-67baa7fa732mr10257324d50.2.1793724985376; Tue, 03 Nov 2026
 08:56:25 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261003142421.GA928135@rayden> <179190782426.417156.7349166225974438759.git-patchwork-notify@kernel.org>
In-Reply-To: <179190782426.417156.7349166225974438759.git-patchwork-notify@kernel.org>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:56:14 +0100
X-Gm-Features: AclHuK8GWKzy4ZGIJgooX3-bBwT3fsRhDVTAMNPWQTrfjn7qnTe93_N0jugQQ3g
Message-ID: <CAGgiveWQGdoE5FJhiSrEq8minjzvUABOzNJgOGxuASzAUak+xQ@mail.gmail.com>
Subject: Re: [GIT PULL] TEE QTEE update for v7.4
To: patchwork-bot+linux-soc@kernel.org
Cc: soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DGGLVXVlfyU0qGJQCqSMP25r4nNA2Fi8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NyBTYWx0ZWRfX5GJQ4rfGR1kH
 LHmAxyBZpJAYCIH8SsAx4Ly/mup2OzlGYA80LZoAV3aMufxCyBl7f/qjh0mXAiwWwVWTX7lRxj1
 mJqx8Xg89yOOl8SxFJXkTKcM4Svzo3g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NyBTYWx0ZWRfX2DlM8O5VhcBz
 s9RbiGOACQpYbZmy18cHGws0uEbqCJp4+QHTmeGOHhKHKkmlh3BN45AB72BJ9CVW8YZbLtO94wM
 JeownJNQmYV7P395+N5PFhtFX2DqTrGbD6TgbVkE+L42iBLYlvz4dF8WdOtFF9bAOEjEYPDoSqy
 W3uBM7PKbd3kl3PDsCIdy3WBsdSW0dbTnXM3sDA4AFjufdEsMa9420LN993c7NMSQJToGo/prKx
 Cb+qrSV6ZTBH2cEcaazbyKpRNZHWx0xHCrg/EmsDxYFJOREi+1HR2ikCKuDpUXxcrZQ5V9Xe356
 NeDYY/UQF7/Q/gx8W38I1wmHfikb6RHyLHrSUZkd9I1Hdj3pCeWQXDmussFlFRySzBUHKGTG+Gq
 xHkTKKk1R5W+HFmzUqsXR9LO0k8rX/YBoE+1W8G+cisw+7izhkMDtYOrc1CBIf5Bx/zflX4jQTR
 Q1ujmoTbbB02bV76wNg==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6aea123a cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=-O8mBYTmuOtuSf5j7y4A:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: DGGLVXVlfyU0qGJQCqSMP25r4nNA2Fi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030067

Hi,

On Tue, Oct 13, 2026 at 6:10=E2=80=AFPM <patchwork-bot+linux-soc@kernel.org=
> wrote:
>
> Hello:
>
> This pull request was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
>
> On Sat, 3 Oct 2026 16:24:21 +0200 you wrote:
> > Hello soc maintainers,
> >
> > Please pull this small patch for the QTEE driver in TEE subsystem.
> >
> > Thanks,
> > Jens
> >
> > [...]
>
> Here is the summary with links:
>   - [GIT,PULL] TEE QTEE update for v7.4
>     https://git.kernel.org/soc/soc/c/a2f5da3f5c0f

It seems there's a mistake. The pull request was for
  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git
tags/qcomtee-for-v7.4
but it appears that tags/tee-for-v7.4 was pulled instead.

I didn't get an ack for the tags/tee-for-v7.4 pull request, but it's
upstream now.

Thanks,
Jens

>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>
