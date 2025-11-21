Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF82FD68D
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758209; cv=none; b=Rop+formIE1UKjKUgL/xMVWFPuoUheBr90huvCwz9DU5b6FE2RZr2sLDM6h7EJRevfj7GIRQ8CS4KP9VihOuAWsgENXuDeahakrWqKV0RVez2h9S5axv7GVijH0NuP40+qhWREJeFVj16msQTQ0dZrPIuFA974pPKyGAGintx60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758209; c=relaxed/simple;
	bh=GtNafWVTYEieoiBrYcjjoxiUxAQAu22x4zjHBxSpNcs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Gg272Ph43VbSIGkhFzcp3B4SsVZjsjrqPD6IVCfLd04dvkvjLWBrT4uTKaCtLmd7hgLGluWaPbKmeqEn6tDjdGJOy9PHqFYpimDrjD4ZfB8PwyE7i1R3i8dVr39OsDRvRXWs01WjPw5LvXHgg0zR6CLJHOWvdr6slXhDy56kjNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=O5ltxRqc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Safd8epi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="O5ltxRqc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Safd8epi"
Received: by smtp.kernel.org (Postfix)
	id 01480C116C6; Fri, 21 Nov 2025 20:50:09 +0000 (UTC)
Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7EA7C4CEF1;
	Fri, 21 Nov 2025 20:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7EA7C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id CE2591380196;
	Fri, 21 Nov 2025 15:50:05 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 21 Nov 2025 15:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763758205;
	 x=1763765405; bh=+MroMTBYaN1V2eG9itTrxK/f1uqlPkCiqSCWwUjIE9g=; b=
	O5ltxRqc5dJDMWd4sbZLbyKjKRz5o1GvP6BLxCsToeHUmUlf+PBDvMV+FNMZa4s0
	Tf25Pw7jfs+jGn7F0/Kavhmmvp0knHIyfHSK9AfZzoRlA0EfsdRMUSVmIoUwMk2I
	UMBF4nnUgPpK5m8oFW3dA7eL07i3jhktPQqXB7tkpDHat3GyGXyFL9ae4GxHGF+N
	vSxTXBcoIgl3cZw0JP4AXE5LUv1awPVSPhnOjEb/L9s9PCOGus33eCOpp7qrcqlI
	ex7MbjJf8AHSug8xPjh+JAxTd69beA5UPS8M/ca4U9sgUmJ9Er+wNxFLyBFUQ4ag
	WuuTr7LKtRW7GAtG/hPbhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763758205; x=
	1763765405; bh=+MroMTBYaN1V2eG9itTrxK/f1uqlPkCiqSCWwUjIE9g=; b=S
	afd8epibNDnHKhKSDD2vJejEb+SNKuGTTpzYedBw6s2jtIJToX8Jt9P/LUIank3A
	A0JzLY2C7f7RjST7Oevcyy5qZe7/QQ9YE1ok9TCoMNyVavUSNYVnX9vN+mab7SqZ
	bIb5Xu5kwE+q+4Kvgv5m05KcNioUW8kQIe7BZq884Z33ZB68ZMGz4qjXkHbSXhTL
	KMi59pGA8afGr7mLB/aINDkLTRRC76S1hqXhUyJoSWjRfc1sl1GHrtDFUmsq2dIf
	DVBo2ut+lN3FNvhNc/IH1gBqrYt7wQfrzlybscV5LyWv1lqywF1YDamiAdVANxgE
	tgnimsBT/Wm0E+lSqzeGQ==
X-ME-Sender: <xms:fNAgaUV0LAtKpbUKZyZ_RpasTARkplipVapUh3RwSGTrIL75R1qHLQ>
    <xme:fNAgaTZTjpNyyUGJTxuL64GHZyZdpEbawGSd44ll82lFMBRVEQ77s6jXcD-CWfymk
    h3TaMzY3pv3Y710aXtlUsC76-aCyn8PXBAKZ5dIj45FfDRgpcj96og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedtleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepuedvvdffiedvjeevtdfftdelgedvvdejiedtfeeltddutefgjeeuheegheduteef
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpuhhrlhhfohhrghhithhpuhhllhdrhi
    houhdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvd
    egpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhuphessghrrghinhhfrghu
    lhhtrdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtg
    hpthhtoheprghlvgigsehghhhithhirdhfrhdprhgtphhtthhopehjohgvlhesjhhmshdr
    ihgurdgruhdprhgtphhtthhopegrghhrohhssheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfuhhsthhi
    nhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehmphgvsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fNAgac5B7JMb2Wbeg6MbD54hOsoDJn_QhuutkmPMK6Uy--bkgh6vbQ>
    <xmx:fNAgabt1C5FfsJ2aczJRPhKSOzCHN0giQ39OMqbjmzQkkVy9kV4yOw>
    <xmx:fNAgacWh7eCV8dv5w9yFF1_vxrISn_rECFyZKMkWyaot0g5Xj35cXg>
    <xmx:fNAgacHl-JL9eUkwSB_oJXUbaB2brXOMG8xXx2D-FU24o838k_EFjw>
    <xmx:fdAgaW_GV8y0zNR2CNTwknlinigSU75zqYhIN6tre3Xyq6Sf1t6wiDY9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 564A5700054; Fri, 21 Nov 2025 15:50:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AxHevFwGHmhV
Date: Fri, 21 Nov 2025 21:49:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Drew Fustini" <fustini@kernel.org>, soc@kernel.org
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Anup Patel" <anup@brainfault.org>,
 "Joel Stanley" <joel@jms.id.au>, "Joel Stanley" <jms@oss.tenstorrent.com>,
 "Nicholas Piggin" <npiggin@oss.tenstorrent.com>,
 "Michael Neuling" <mikey@neuling.org>, "Michael Ellerman" <mpe@kernel.org>,
 "Andy Gross" <agross@kernel.org>,
 "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>,
 "Paul Walmsley" <pjw@kernel.org>,
 "Drew Fustini" <dfustini@oss.tenstorrent.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Message-Id: <920f8f04-92dc-464f-807b-d09cc77c5532@app.fastmail.com>
In-Reply-To: <aPUemXdOFZEdkayE@x1>
References: <aPUemXdOFZEdkayE@x1>
Subject: Re: [GIT PULL] RISC-V Tenstorrent Devicetree for v6.19
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Oct 19, 2025, at 19:23, Drew Fustini wrote:
> Hi Arnd,
>
> Please pull these changes which add Tenstorrent as a vendor and enable
> support for Blackhole. It adds the appropriate entries in MAINTAINERS.
> The changes all come from a single series [1] posted by myself. Joel
> Stanley has reviewed and tested all the patches. Rob acked or reviewed
> all the bindings patches. W=1 dtbs_check and dt_binding_check produce
> no warnings.
>
> [1] 
> https://lore.kernel.org/linux-riscv/20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com/
>
> Thanks,
> Drew
>
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   git@github.com:tenstorrent/linux.git tags/tenstorrent-dt-for-v6.19
>

I pulled this one manually as you had the wrong URL here, please
use an https:// url for git pull. You can do this e.g. by adding

[url "https://github.com"]
    insteadOf = git@github.com:

to your .gitconfig.

       Arnd
