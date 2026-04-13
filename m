Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E143A389111
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 06:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061462; cv=none; b=U7+plYn9JQ/IGA8HDUAANEcpYR0PznUhg6PG3g7oR20neSNC3hNX5+N5xYLFlYfoPhROaER38rxyRkoOCJL4g6HmOp3beoSaFB1+BauNf3lwBTd+lTIAo7GHtKFb6xODEqTwrhA/7p6uZuKU5s11ngXwEYZGhLzckjOiZHb1h7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061462; c=relaxed/simple;
	bh=xiJ1TaIK6tuLUTvVA4rOAiLZbjlv9meyWs51j4OzaAI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=G6fbnAh5Ps9cT5DS84i/24fkKqcWnr/pCZo0lymPCE5bV8O7GcsaVYks1iOrjWnoYSeJDq4FU/yDs838JremvmFAu1GrHUGPH5GBVGfxMPzaMYYlDBnqAaXPtV6LXz4YrpuxVOmCiLxehBJNotRrGhKKjdYeedGVED3A1vVton4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iG/89k6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iG/89k6H"
Received: by smtp.kernel.org (Postfix)
	id 97CBFC2BCB5; Mon, 13 Apr 2026 06:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580C0C2BCB0;
	Mon, 13 Apr 2026 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776061461;
	bh=xiJ1TaIK6tuLUTvVA4rOAiLZbjlv9meyWs51j4OzaAI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iG/89k6HIWRTFF2cNKRhzQ89mb6Ohocm6LqnRCt5+zxUfjVzAEtnlBSAKrDsYzuav
	 Gbdm/ynYMgZDy/4Fi+bPj1rU3znguTSN3vRIdW9DjhFI5oySx/46SSRg90vSuT4Uhr
	 uOSmaqUY1EKQWmHnItWz2eORwnv18gEHWnY238KWC8+b/3NWbgnFkA4ln1DXwdAfBI
	 YQoSYy5wFD0hB5cSxaX3xISq5UvNe+wxDNpr0hfJzwshFD/OEuFbmZBCB9sn0zJ+0v
	 peb5wvIgfKuvaEocUFRSC2xZBeTT3nLKhpVGL5G16TeAPmEtsy6kwaOeKgFF8CQlaO
	 WorLvzydRmRyA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 477C9F4006E;
	Mon, 13 Apr 2026 02:24:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 02:24:20 -0400
X-ME-Sender: <xms:E4zcacPteAAIBjTEk0Xn-8rgiGW2UKl-17biAuH4txId33cGoRLItg>
    <xme:E4zcadxBbf4qeXsK05ahJqj4fYimXuTpL3dANqYqLskTNPqnM1AA5gCnYimPSTcUD
    toK4UqG1LkTjSPl9_HH7K-wSPbY-bQJyOI-VLKWsus8c7mcFpzRA78>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhhm
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhuuggvvghp
    rdhhohhllhgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
    hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:FIzcacy4D4_fCmxG4Cn9Q1CE3pbtLq1EfHKG9vdYRtFTLtZCKX7JXQ>
    <xmx:FIzcaRwhatPV2jBCJmNARBfilRu2FaT8hIaCMWYfHipoqvj529dLJg>
    <xmx:FIzcaeb91GCm5z6BX65igRAbFRavHrIpGp9zHKF9fPOD6dK_aHSk3g>
    <xmx:FIzcaaUY0R646qQNQ8A95YtAeVUeIFmUJkO8d8wOfONdOcMqwXcA5A>
    <xmx:FIzcaUgEgR_SRaceBasEq8gUGH6grOgKaOOTbtvHUJvLIs2X3Y9NF8ij>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 33F5F700069; Mon, 13 Apr 2026 02:24:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AX0_rBoRXIrB
Date: Mon, 13 Apr 2026 08:23:58 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: arm <arm@kernel.org>, "SoC Team" <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Message-Id: <45bc09d9-33e0-48c4-92a3-9bf8e64ef80a@app.fastmail.com>
In-Reply-To: <20260411-exotic-astonishing-piculet-0cd25e@sudeepholla>
References: <20260407100841.3150090-1-sudeep.holla@kernel.org>
 <20260411-tireless-agama-of-advance-5bdabf@quoll>
 <20260411-exotic-astonishing-piculet-0cd25e@sudeepholla>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Apr 11, 2026, at 19:35, Sudeep Holla wrote:
> On Sat, Apr 11, 2026 at 10:49:50AM +0200, Krzysztof Kozlowski wrote:
>> On Tue, Apr 07, 2026 at 11:08:39AM +0100, Sudeep Holla wrote:
>> > ----------------------------------------------------------------
>> > Arm FF-A fix for v7.1
>> > 
>> > Use the page aligned backing allocation size when computing the RXTX_MAP
>> > page count. This fixes FF-A RX/TX buffer registration on kernels built
>> > with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
>> > larger aligned span than the discovered minimum buffer size.
>> 
>> Can we avoid per-driver trees or pulls? You do maintain also ARM SCMI
>> firmware driver, so this could be sent together? I think you also use
>> the same Git tree, right?
>
> Sure, I can put all of the firmware drivers I maintain together. I had
> for some reason assumed individual PR is preferred.

To me, that's a function of how complex the changes are and how
you describe them in the changelog text: If you have a lot of changes
for the merge window, having one branch per firmware type probably
works best, or even multiple ones if you have a series that implements
something new and a number of random changes do existing code.

If you have only a handful of bugfixes across multiple firmware
subsystems, a single 'firmware fixes' is less work for all of
us, with no loss of readability in the git history.

      Arnd
