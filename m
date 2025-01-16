Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155BC156C76
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022412; cv=none; b=Pn6fbRyy4Bv8gIy7jJUCycfEeljbBpfbUBUvZOqdgjIBAgMOmOF9Mz0LLBKVFyHdoN/2jLyBzv/2whOiq+XRgZ3HXnfF7udR3Hclm87fgfSrACiNgAz/AxVVO+84isvr9ijY+f33FxyKX0zeK9VSEexnM1qvHFXifJqSWTGGaxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022412; c=relaxed/simple;
	bh=6inQgk/tCitO0PowNsL1ePxD22FAZRMF38lHIBA10Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ai6vWHYRmIEttG8jh7Nb927C0s1VhsAIFRUnF4gR2I1Dphn9jlvGbPjXmcsjt5nIJSV6eey9Btt2dWk+/99PBg73MBrS1s/LnhrbZNizKW7mz7xwVoHzzXSE4cLwHaY1s74gG00LOB9n/+0HkD0kLo2JOqTnzoPWj9uQwNRJwgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BYiUKqnM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BYiUKqnM"
Received: by smtp.kernel.org (Postfix)
	id A34C5C4CEE3; Thu, 16 Jan 2025 10:13:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A8FCC4CED6;
	Thu, 16 Jan 2025 10:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A8FCC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G9p6mI027426;
	Thu, 16 Jan 2025 11:13:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kn3z9Oj680dJoU9+eAMtC0WxRMZrxRwontsz/ZPmtmA=; b=BYiUKqnMDS4Dkuq9
	I5hhMuyA9CzU69RzFkFn+paQ2792xuz6WO68ubj/Vo1z5Op3kaux3NKHxc2soGtu
	WktQ4yp7FkGEwDn1i8y5Gna+wHvcHQKjcyaojn9bmmhiLWXrN+4SUHBeiGB3B2u0
	DW4MjtYswEe87sWv2ULU8E8gXu843qfRcewzF1hGkgoO3p2ZpOjUzDG0zYpRqvQo
	9Lqdu1Dr3nqupNOgdXpnIWEdcpdakGhkqV8LEE4iJz8v+3HJbF5gfiTbJz87/WdL
	HLzH9r5fV5hkgR3+8mWMokeXGi9+MYfUW7tVgkDKwKtA83t/kK2OnoEM6GO72KV+
	w4SJGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 446gbm36kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 11:13:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 805E04005C;
	Thu, 16 Jan 2025 11:12:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E35C27CBF1;
	Thu, 16 Jan 2025 11:07:42 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 16 Jan
 2025 11:07:41 +0100
Message-ID: <736426f7-2c4d-4627-8626-e9b8ed65ad32@foss.st.com>
Date: Thu, 16 Jan 2025 11:07:41 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] STi DT changes for v6.14 #1
To: kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
        "arm@kernel.org" <arm@kernel.org>, <soc@kernel.org>
CC: Alain Volmat <avolmat@me.com>
References: <f44cb1f0-4d91-4e25-8b1f-3dd9a7bed62b@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <f44cb1f0-4d91-4e25-8b1f-3dd9a7bed62b@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_04,2025-01-16_01,2024-11-22_01

Hi 

Any chance for this pull request to be merged for v6.14 ?

Thanks
Patrice


On 1/6/25 12:16, Patrice CHOTARD wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STi DT changes for v6.14 cycle.
> 
> Thanks
> Patrice
> 
> 
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-v6.14-round1
> 
> for you to fetch changes up to 3b6775857d7e8ec8887f632ad26351f2f9d826a8:
> 
>   ARM: dts: st: enable the MALI gpu on the stih410-b2260 (2025-01-06 12:08:52 +0100)
> 
> ----------------------------------------------------------------
> Add and enable MALI400 support for STiH410-b2260
> 
> ----------------------------------------------------------------
> Alain Volmat (3):
>       dt-bindings: gpu: mali-utgard: Add st,stih410-mali compatible
>       ARM: dts: st: add node for the MALI gpu on stih410.dtsi
>       ARM: dts: st: enable the MALI gpu on the stih410-b2260
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml |  1 +
>  arch/arm/boot/dts/st/stih410-b2260.dts                     |  4 ++++
>  arch/arm/boot/dts/st/stih410.dtsi                          | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+)
