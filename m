Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EA91339A4
	for <soc@lists.linux.dev>; Tue, 14 Apr 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178583; cv=none; b=B+/Ts3PRPs5+NJnXbrmUCluG0JrKcs5xzf2t7UWIpOUw4mHCC9d25qqNKvJf+HAI8tAYUCIf9j6ZlwbNIFwN4susK3jxu8HQRaPozIonQ2etPKk5qE1RikFG+OzkphxVKhs5jcThVLLuBH/PshPSVEPoPqe0jG6uYx9yZuPOKqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178583; c=relaxed/simple;
	bh=mxJm4JFoTJ2KITJlOr2eq2X4iWII1Zaic+bktd7DxlY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GjVyFfY/idZe4zYcGaYJTKMvpXHLej2Us/pQ5JSe9YO+daxu7KzGlPco/jPyLvyUbJza++i5lGTifi9v9DHjCuU4/CBWqQd30nBkSYlW/SL7wDVipfIRqtOsUW0LWqbMH7lOUswaHXQhengIGjEJyy6qavniKgNUApWi20yqUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=bGKxjEUQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RDOYXbWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="bGKxjEUQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RDOYXbWy"
Received: by smtp.kernel.org (Postfix)
	id 4A3DCC2BCB5; Tue, 14 Apr 2026 14:56:23 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F145C19425;
	Tue, 14 Apr 2026 14:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F145C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6FE6D1400088;
	Tue, 14 Apr 2026 10:56:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 14 Apr 2026 10:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776178580;
	 x=1776264980; bh=A2BcP/gRSwUwHAq9cjvJKcwNFmkhB9XyYu8CxcvkNgs=; b=
	bGKxjEUQXyEGU3cJ51AyPY6ACkU0nv4W6uoChwPrhUWO2kSG4kZrjk1tsZujbk62
	JggpHIlz5oFGFrFOMZjvhTF+trgjhp2F0TS+U0Yq3Eh0zWrCaKhzZ9M07+7JBO9g
	tOlzK571yzB0H1Vk+B2gjG1DLtsNJLcDsMgJ9ItzM75XFUzSVr8Mjy5DVY6ysaxZ
	slHETdqHmeCTm5FP3w8K4oBRAXbOCpeA6eZlTWsXpR15rORtMReQICU97jR/jcCi
	10gvnH+RUPnVKyZeUMfx4A9Jj7q7ZjJnThsXutlk857F+MudBuT6vZyV95yRVczq
	RT35aOWMrnw6x9ZXHMEdpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776178580; x=
	1776264980; bh=A2BcP/gRSwUwHAq9cjvJKcwNFmkhB9XyYu8CxcvkNgs=; b=R
	DOYXbWyQc61tccpAILj1Hm5iWSeXQo7YtYYQjylLI+yp+ZcOdpeVzcs6dCDIBrdu
	iLOd+G3s2YgEyaltDkmKzJVGz2B7NNY2+3Qvpudfw36b5+nzA5mxtBLenLpHpPIt
	htJgeGuuAxoKllqY4o96WdJlVVh0ReFuplhlhFHfjcFoTLpKZlL7PcsZi7p4/6+N
	e0/nBOJrVxpLt1sbXqlU4Z9lc8Fkzl6GLMzZKZ4YMg2s7oxLQWtDXofVvVUiRaSL
	IR+y7Q19WzgIgAkm3XD3hoB5SDNX02CvCBQ8W9XU1SB8NsQsN1ngTBFH3gWDY+pq
	WQjgeM6Dpq2K5HPncCi1w==
X-ME-Sender: <xms:lFXeaaTpaqZAyVkCFr8qIhL6JVV9EklS003QLJ7fhAcwyiw3Ji9YyQ>
    <xme:lFXeaammLWDUEcu1m54r5fYMjW_tPqCnCuPLylDriteOLBEERX_Ju_WD8Fyn2e8OI
    0RB7DtZtAYEMFjkmQy_4QMCBWLl-K5eFc4FSTLu2I3U6HWpVZ-s9M8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegthhhlvghrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsoh
    gtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehiohgrnhgrrdgtihhorhhnvghisehn
    gihprdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:lFXeaQ6vbhlCqM7PydlqlgOlF7_Zcxud3ExaLZAPwFDPqF-q_03VBA>
    <xmx:lFXeafsqb6M6uapLWpbyCRIoxtU5wbljhy8-MK7rk7wG51Zsys2LVw>
    <xmx:lFXeaZ4EmG3ZrURDYNZAzUdqAZxyTOCnbCFYo7ryhH7rKMgkyyPnHQ>
    <xmx:lFXeaSU5HtIv6PwUaYtZPsONncsPT7EhWxilJTeWVxM_MiwChgfk5w>
    <xmx:lFXeaZtc7xOI25MqbiwhNJrtudWDiBvTzRJqOWoeHtA2WNHw2R_C3eCz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2104B700065; Tue, 14 Apr 2026 10:56:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ArHybFH20ckc
Date: Tue, 14 Apr 2026 16:55:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <chleroy@kernel.org>, soc@kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Ioana Ciornei" <ioana.ciornei@nxp.com>
Message-Id: <f48af0d1-0980-46dd-b2e9-081b019381e2@app.fastmail.com>
In-Reply-To: <69cdadd6-523c-4a79-8cb3-1deff5910699@kernel.org>
References: <69cdadd6-523c-4a79-8cb3-1deff5910699@kernel.org>
Subject: Re: [GIT PULL] SOC FSL for 6.20
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 14, 2026, at 16:08, Christophe Leroy (CS GROUP) wrote:
> Hi Arnd,
>
> Please pull the following Freescale Soc Drivers changes for 7.1
>
> Changes to fsl-mc bus are reviewed or acked by Ioana Ciornei.

Hi Christophe,

This is really too late for 7.1: the merge window is
already open, and I see that all the commits have a committer
date of today, though some appear to be freshly rebased
and had an earlier version in linux-next.

I don't think any of these are urgent bugfixes, so I'd
suggest you rebase onto 7.1-rc1 and send these again for
7.2.

       Arnd
