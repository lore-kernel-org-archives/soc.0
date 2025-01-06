Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBB6126BF9
	for <soc@lists.linux.dev>; Mon,  6 Jan 2025 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736162350; cv=none; b=hPwvWmMI6XfVjEtAR7iFQqglZbQIY5ZAUYjWPjlgMbN9Amt/MuNNWi1ZYJOp4gmPR3pNwqKx6hyKgz87gKIVYqKHUaUSAW6CuK6aR4Wmn+PsxalTmqJ58PtbGd34xc4HUZQuYpKCm/AirU52pbGUJvX9qDEWs6QS++0ojiKpEgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736162350; c=relaxed/simple;
	bh=+ixwVvbbaUSLEvV+mn2NSl4Cju0XEz5fFL0Tr13cpMo=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=r8o2JB12+2z0fl6VSOV+nPD/kC2lWR4ekdbPBpr2RlkCLqlOM74l+gCd/9T0UbZ3nwNkvvLbb1nHkGdIz1XKwfTzsUXUPWpSLRnZvK8+USZfyb20EeiVGmgcXnOi/ff5PlRigjSV8P1VpM51I+1t4vgWn3uRDZ7i+5hwayj4Gz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Qe8OVE+Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Qe8OVE+Q"
Received: by smtp.kernel.org (Postfix)
	id 3FB68C4CEE0; Mon,  6 Jan 2025 11:19:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05858C4CED2;
	Mon,  6 Jan 2025 11:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05858C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5069EFBk023840;
	Mon, 6 Jan 2025 12:19:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=3n7Ztby76/7jKeO+4cqxxu
	BwFaqI9Xso4pygvnxq8bc=; b=Qe8OVE+Qy/o3hVcpUr9hm9xetxRbiOXpb7hgne
	mdnf2m4K+GMzUAW6gufDS9nstMmiX6/Khh/W7YmEHPo00io75cXqv85tE8aO3cre
	hC1byGXgftCEM6Vpf+FoqYnLVMXRMLdKoUdmooeLhRF8lMez3W99ILXvYGW452bb
	XTNOyVbKLZSfSV4iUVrKj6+gf4stY25LxKh8eEuNevB7iFcP2dNCAfTQGvpPxBz3
	rJ/yzEwrRvKsOxcb8NdtSKoy05+GvhE40bDVLOX4q5KeII5TrtE0RgqfgjOXgFEX
	xxRvNa5yulA2S+9lLkEcErAabMdaN0fMyvKfD+qAtwA+DJ3A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 440cc78g38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 12:19:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3B1624004B;
	Mon,  6 Jan 2025 12:18:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC66E266A42;
	Mon,  6 Jan 2025 12:16:31 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 12:16:31 +0100
Message-ID: <f44cb1f0-4d91-4e25-8b1f-3dd9a7bed62b@foss.st.com>
Date: Mon, 6 Jan 2025 12:16:30 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
        olof
 Johansson <olof@lixom.net>, "arm@kernel.org" <arm@kernel.org>,
        <soc@kernel.org>
CC: <patrice.chotard@foss.st.com>, Alain Volmat <avolmat@me.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT changes for v6.14 #1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi ARM SoC maintainers,

Please consider this first round of STi DT changes for v6.14 cycle.

Thanks
Patrice


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-v6.14-round1

for you to fetch changes up to 3b6775857d7e8ec8887f632ad26351f2f9d826a8:

  ARM: dts: st: enable the MALI gpu on the stih410-b2260 (2025-01-06 12:08:52 +0100)

----------------------------------------------------------------
Add and enable MALI400 support for STiH410-b2260

----------------------------------------------------------------
Alain Volmat (3):
      dt-bindings: gpu: mali-utgard: Add st,stih410-mali compatible
      ARM: dts: st: add node for the MALI gpu on stih410.dtsi
      ARM: dts: st: enable the MALI gpu on the stih410-b2260

 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml |  1 +
 arch/arm/boot/dts/st/stih410-b2260.dts                     |  4 ++++
 arch/arm/boot/dts/st/stih410.dtsi                          | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
