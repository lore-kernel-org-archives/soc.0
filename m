Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA73B19A6
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777488640; cv=none; b=gp/+ABq/NCiLUW/Fq62bjO2q/6lJ+OguPTQcvpVP9ipJTyxc1zIwO7FDwrGfXX0oWuqeYYQijo22GLmdY8iY66sQy3DqHICvU5Sr2cGHnAH7JfIZK/mgpec4j5E+f4GCzQeAjViWQbndj2JUBC0v9Ynnug1+7ZjVg5emfkwtL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777488640; c=relaxed/simple;
	bh=j+LOW88eQiC5n+Qsdr/dKLNgPzXRFoM/jOnnt+1HJXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLwbEc4WmRtgKAsJfkbZ8N4W4BXocY10ooGcTei1lkUuwUnjpLkCX20AzHavMmze4Gx8t31W2RWQVPmEwVHSDeUb1gDERAUFctEeWbnjeXtinVijh0k0gkqC4Vcx7Yfsb6ZzZkYqnFWzazdzRhL1+NelELcccc8+MFTpn0nJolY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCdYPvht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzCAYczi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCdYPvht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzCAYczi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TG5T5L3856945
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b81T3BirliBEA4Ca2PjKIh2zUmRWNZ6bMgop4mGPNAc=; b=dCdYPvhtHeleA1bM
	IB02IA9SLNy31LFBzAWoWW/nANl02OtGwlnJJrUvYUNZCFgYUgkOjky/D5R2lY1j
	YqqKr99iH4CZoYjpnOPdM9GFYCLFgHLzlQ7SnhA0rkHOqH/oODKeqIfQ2kCdjxwE
	MrSFDZE0ppnB8FYepiKqN1n8LE6wEr0eHHwwhgaax1Ske+vMxk1OUZ4DIdKsrZj+
	Txu6kWo66GYPgSMLpAvE4ThCUNGmgY/Fq4zRZjp1fQ8Ip2loT0LWdkS2qO+i3wmB
	AVUSxQV1yeTciOTBxTZGMWMAzU35BkTAQybSOo2o9/PdgRabz7pGrLVPzzHJbjB5
	FenNgQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71gpvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 18:50:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e5a336b44so3022271cf.0
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 11:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488637; x=1778093437; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b81T3BirliBEA4Ca2PjKIh2zUmRWNZ6bMgop4mGPNAc=;
        b=OzCAYczit2UZoHcJ6uz5EVq9KwfNnm+1gb71dHeAWveGcdsPyq63DD8U6fT4stx8L5
         6Fp+tssffDn1a7e0glEONdmq1AxbbDyHr/wtev9ALSjkEygIJBx3GsEOFIIGkblzZzlo
         zZmJLEhqkRub2KfM5hGh1EGv9fsGymD1g3WPOwmcCSKUbnQqCw0/fMk1HLdJNMJbL7dO
         DgMRSn8cgighiFzXv5SpwoHrjR0/AKt5ds676IVBSQj2Kgzp8+Ey9tB3zaNUeqpXPyvo
         U5Uqm98/rWeoYlDG27DaxyHvbC7AU9a0D+k05Mgc6ovHG3waL4xF6q4lWhXjh2hGzrS6
         zzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488637; x=1778093437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b81T3BirliBEA4Ca2PjKIh2zUmRWNZ6bMgop4mGPNAc=;
        b=IVQOy0X7ZTt3iF0LGnAJxeZrDMJv4cTBWubhlrmXoH2CyBqWSZ4SEFsh16Fdo6bBbX
         VheNaJIWHhP0xlBKsiSXHL4DDhkh5gOZtNAnJ0WN4SFQI9nrm+tGNGvQ3S0bfZYnaiy8
         v5KH2RymFPOx5kDPyhtdF06zkKRGu0LyhPmkK2ppyp9grL5tZr1YI2+kqmWW6S+X9rJz
         f602R35hTkzNx6aJX1NtWIO2dE4VvrrgAZ+lwjzg2F72PFvzqeMlJ22yImqqDUopMeYJ
         pKk2m4q8OLl4SfXju++CPyXquar+g35WQw9Hv3NNyyIaG7GFiA7EI3QDsKKQDeYTS0Hr
         jquw==
X-Forwarded-Encrypted: i=1; AFNElJ9ltbpzEedWQKQKRdwTIiJXtKvVKwvHAXBJA9QqX/QEpSVTl7PDnIntolCNhLMJsE/KJ9s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZrpqUUj7RVG0CRUiuhllLGkDX7ckGyf1DEoVXzmrCq91tvB5R
	pLRueGsHnBgbp7K8pxBZ8iPI5jHMdfHMSMNj7wL+eBTbC9+0sGiCbjcjOMHvkAnkvglFDYr52UZ
	yPQcCgYnjTmTAfS2N0X6QMxh6nmIvI/D4YlEwlHqhHFqnDvZ1mchFovc=
X-Gm-Gg: AeBDietUv14THdeKATLVB2F7zhQXz283Wpptnhg8AfvfwXIh4oS6vYWMnlnSLg0El11
	jLIKAMuY/wAF3xmj7SKfVRLuA8pnaGF9IIwXBVvyfdrJ9Nwk6bfEPhZ6Rkmla6gxaWnF5mHNZQ/
	bAJT716/0MvlYfJl1uhhY80xj8mf/ga9xDyP3b1K2dwvQ5hLHkWuzkM03CTdGEkS9/9AWXmHNZ5
	z1mqUPt3yovpu7ryD5kdL7WWILvaPVguU68LrRPkt+kSfC0PhVq3NO7Ioh9Lga3ZnmgfS+Mk3gn
	dtTQnrD5jNCqxL0S8t6NQdBIoBttTUax4W1MxBht0Ssw1ZkCUagMikIUZtp+LPRo4izz4nH7cQp
	85/2LE2aZyfPbMrj36hhURcUxIxkWNn3R3ZZkVDnloQPexRPLz3TxnYA=
X-Received: by 2002:a05:622a:8c08:b0:50f:ddba:af82 with SMTP id d75a77b69052e-510199faa91mr48517041cf.1.1777488636780;
        Wed, 29 Apr 2026 11:50:36 -0700 (PDT)
X-Received: by 2002:a05:622a:8c08:b0:50f:ddba:af82 with SMTP id d75a77b69052e-510199faa91mr48516651cf.1.1777488636366;
        Wed, 29 Apr 2026 11:50:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:50:23 +0200
Subject: [PATCH v2 2/5] arm64: defconfig: Drop unused legacy netfilter
 options
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-defconfig-v2-2-e4ed4186028b@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j+LOW88eQiC5n+Qsdr/dKLNgPzXRFoM/jOnnt+1HJXI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lLzB28YdnwArPhetV84UVHCs4XDHxtvf6mUT
 2DX/V0xin6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS8wAKCRDBN2bmhouD
 11UkD/9qjBkdNjsuVieru3VpL66vJGz2kSPicEX3Q76CcVWFlBtDC1MnRuqsQJm1ZqdMYGs5rgT
 9pGMuY3yV0GISmE8elAD5Gq9aViR4CuDDpRaNtzsrtOgnJAUDV6pQW+2YeTDiK2Bm0JJHJHhkCQ
 QsnsvWCBadTF5LSNZcGsUUIQxYnxCFBnOOxLIyKNuJMkUThTj1iIVWR7j+Y7FuH3pMN22O4TceE
 1riwQk3ppTq3I5B5V2sZpnnG1PX/Qi3y1Rkt+4CalaAALUrf0I0SAxfl9P0/X1jrEbydSxSMZkY
 0YsZiBHEIGVB9tH8KCPBkdWujYjC3CkHNQgvyqA41vbEZ5UbxRNt8i1K9Aik37cCXNx5nLyuYc8
 jeYjzKlzYodazU7ShhtI+B5IBj2d6sb0vK4tjUfAUrtlxfbKmINlRuZi57lkjdXQ9maali7QfK/
 pNHgHEL6bEKprx266N3Vsj43YIZNcLgzee0eUny1PwSAMQrej3SJNDvu0aqVx0aHObhOxsLOBzs
 FHTvvLHjidAxBgMB+pVvLHKlIPqMN0/kWSfUPoNlK1BvzgFhu0xIJIOvdZMhUB5VgvQXetPZgbd
 KrHDD+9Szko8OBUhEKfIWho7AwAkkR+rmzFZdqi1Wo8yWRsH9r5xIdPVUE6CURbQOZtw3HBn/+l
 ra2utMWhlFkfXLA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: T57eL4oqgNBnIrJMV7Sr3944RFOXSV8h
X-Proofpoint-ORIG-GUID: T57eL4oqgNBnIrJMV7Sr3944RFOXSV8h
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f252fd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k-PMdL3Rd_3TYoQcjAcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4NyBTYWx0ZWRfXz9NtYMGqb4kN
 PQX5qm9+0ZixGThIvDedoEGk7SEzewFD6jNfRQRxBN0xM48OofTUmcS9LwcE+Vr7Bt5Nfy4TfWk
 baDW3Abd+iq1RKh4ARtmeSpz07hV4ZtFa3ftYcP0Grq+uEkZMkpukpTiNeGCf4eT61K4UMc1eRH
 id+Kp2RIgeSSSdU3lI33G3jXV5GifBf+nEuq93Y3HB74TmTpi47oF48VcwOB22JemP5OW6cU8+J
 srLm5sPTiKA5btBRFPJ/9rEWgFJ2cILWlcJ1MPIlPhxDq1+8h4vTYxUmnKC3am9/8vhDsq+nLve
 VXUg/SscFD6rvhtMmD7NfDQJXn3/T5f/eANcdRtn3uBUb0Dn9b7WgSZQ7UlJQvdz+xGyR5mwctv
 wUNPvqxT5ZtFAH52StC5QkKZNrJvD4rL0Th7QEJBJM7mZl0Dv4ic5keDZm/fp+q6z+8D2S6cV1A
 SsCXToFnPOi4mc7cOsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290187

Drop all options which are ineffective now, because they depend on
disabled IP_NF_IPTABLES_LEGACY or IP6_NF_IPTABLES_LEGACY.  No impact on
include/generated/autoconf.h.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c03ae2c767e..9a31b258a56e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -155,17 +155,7 @@ CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
 CONFIG_NETFILTER_XT_MATCH_IPVS=m
 CONFIG_IP_VS=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_NAT=m
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_IP6_NF_NAT=m
-CONFIG_IP6_NF_TARGET_MASQUERADE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_NET_DSA=m

-- 
2.51.0

