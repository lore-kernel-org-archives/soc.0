Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33E10E0
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 20:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742417871; cv=none; b=UvL/X+C307jYuyUrVzyIMDldJN7ac/IyPN9oZstES1aRE7XmciW44IVOlM41ZaGgvA96Gn4yl8Ifxi/ku386SOMbjBm7oVi0yG/2kFA7bTbH18RjDVDIDcSXKz5CM/BIRsD9XKGnG9nTu3oeN4gyVC6jo886TnRZy5YyzvxtYqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742417871; c=relaxed/simple;
	bh=didVpRF8etF3lv/r5tR3PtYFbmfadjQwYcaXhqGPTyo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lc5o8YgHA4RcgNydAV867rnhU+2/Jji8FxtVAApv8UQ0ib5UVUt+W1OZJmHHhOUmhrmruo4kGTNrIPFShCnatunaoF7AXyp8CLeKGF+qjXVIA10EyVCKL193rkIL0e0vU1/pj3yM8JZTlwAA9NgqW3WW8nXQWi4OocsDnB8HwiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Y3U9stg7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b3vwGiTD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Y3U9stg7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b3vwGiTD"
Received: by smtp.kernel.org (Postfix)
	id 0880DC4CEEA; Wed, 19 Mar 2025 20:57:51 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01757C4CEE4;
	Wed, 19 Mar 2025 20:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01757C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id A92C9114008E;
	Wed, 19 Mar 2025 16:57:47 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 16:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742417867;
	 x=1742504267; bh=HBQaX6usdhvuzJxt9TKGHGOwd1AovcnWdd6AKE2CtsA=; b=
	Y3U9stg7L1Fvfl5tP+f2BIWNxWWVW5b+XvzccjxM5viokZMXdFHIYCilADloh58S
	SCYtVAvNEKA2aYxiprSoyIlNNTl6cI7boUawoHZqnKQIw3OhHdVMuqCmUyorgtIf
	70ZjKjjdsK/wWj+PxHgDW73BomaYAUJAcidjjxiB8Sa2M35Z0IXK5f5jx4BRqZia
	VO/+i20HX+hbJLgm7Jy9kK/CbNqDlIYWSIBSKjR7GDn7SpxKINQWRE2AHxhWiY5C
	tCsBGrnAEgCi/hJZ3bszjwppm7LPnuIHUmC/QeomIL84WUtqNQMiemgD9mVPEGdc
	IWAgQd8uRZQE30LxTouznw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742417867; x=
	1742504267; bh=HBQaX6usdhvuzJxt9TKGHGOwd1AovcnWdd6AKE2CtsA=; b=b
	3vwGiTDMtYSBsKz34GB5iokG2K5fYzTdfEpMUJxLuod1zww4FMk69r3oVRtg6jbp
	vpFPYEZviPElLob0DfvlcTbXjgTZbpa0d9JtHBJp2wdH4wrTseKTRh7WCrcTsPIk
	P5LjpIHJ+ntTroJJvi9cJUMA8m1AlFATfWYeQlHmdqVBhd4M0mh9br5eTxZIAIr/
	Hq796XvYUcowIoyLbTHf6wpD4+yULSufrzz+knLTB/O7xMtI7LSLJcRU2SEegGHk
	q4IYAQavRVzG1S7x8RrbmQRTLyHmwH9tavIpRuVe06Lfcr3U2x+aVe0ypvhjiFTt
	EpF1HGXVNdrWS+8iRfSmw==
X-ME-Sender: <xms:yy_bZ0Ro8AKP90Dnn3cx82OgcXZJA6IoTHCmJ2Sfs3B-QOa3a_FonQ>
    <xme:yy_bZxyZr5ydY9o2W3Ait5DFtFry3Ls0bhTgd-lKxtlU7oUjtgfyhSvb0thni1_B4
    WwXKHc0-vbx8B7d1eU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeifeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhl
    rdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grmhhlohhgihgtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hg
X-ME-Proxy: <xmx:yy_bZx2xg99sRZ9LVUvC4WvR7jrZa8Kj24vDhgO-Ra1rf0odXTZUBw>
    <xmx:yy_bZ4Dj0S2SDPqefK-Fer9GKjWsFosQVmdXr0Sa4QFKIAydV-gRHw>
    <xmx:yy_bZ9ihBgsrPkPiIzHMNVe3YwqiD4_S5hSI-oRl1olTAr1ITlpP-w>
    <xmx:yy_bZ0qVQavu-oJxO9eN1zr6JOVGDkucIY0r7wWybtjpE0aepZp9xA>
    <xmx:yy_bZ9fldrYOTNY9XYK7C8UFvg5CkZpbF1lloWWiVfaV7IgDNqDLSutD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EA0922220073; Wed, 19 Mar 2025 16:57:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T9389b2994c5a6e59
Date: Wed, 19 Mar 2025 21:57:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, soc@kernel.org,
 arm <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-Id: <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
In-Reply-To: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org>
References: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025, at 17:13, Neil Armstrong wrote:
> Hi,
>
> Here's a changeset for Amlogic ARM64 DT, also switching to the new PWM bindings,
> adding pinctrl support for Amlogic A4 SoC with a brand new binding style then
> finally gpio_intc node for Amlogic A4 & A5 SoCs.

I'll skip this one for 6.15, seeing that the branch contains both
driver and devicetree changes, which messes up the way I send
the contents.

From the description I also can't tell to what degree there is
backwards compatibility in the new binding, I assume the changed
PWM and pinctrl drivers continue to work find with the old dts
but not the other way round, which is why you sent them together?

     Arnd
