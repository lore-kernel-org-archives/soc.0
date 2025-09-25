Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA373233707
	for <soc@lists.linux.dev>; Thu, 25 Sep 2025 06:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782716; cv=none; b=bC15UOSSyX5qMruN+x6u95Dsrpbs1MmoyyySM4598r7GjhQXGo4P+Tu714uMrXN0x+IYV7JbFuXsc83yjoPamUCyJ9IN69f+m8/8+FPKzfUSo3JUyBP+939CZ0JDOZ3VENwRqfuKqgXy28ggijftB6uPY4uV5H0T6lEHo4JaXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782716; c=relaxed/simple;
	bh=tCHGXjsP4fqF1yDxdToQDk4hYKjcgs7iGL2a9Epdl+4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pixwHT2ryBlIVcysBqBKz1bmqArfNNZY7kUrIZ59yD/MH7DLwLZnPek9QM8puPwIohMoR79O2B2nlJ+Mrhp8qdi7vHNpKSbGxuZ49uDVaqSF59Ain4KoJi1HQS0UT4xU7ZVwtjoZ/xGfeAiUpMLvnJqDfrhpzULRxuGYTNk+dYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=w8EtUZ2k; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N8+L+ymx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="w8EtUZ2k";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N8+L+ymx"
Received: by smtp.kernel.org (Postfix)
	id 48317C4CEF4; Thu, 25 Sep 2025 06:45:16 +0000 (UTC)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B49EEC4CEF0
	for <soc@kernel.org>; Thu, 25 Sep 2025 06:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B49EEC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id D77B51D0011A;
	Thu, 25 Sep 2025 02:45:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 02:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758782713;
	 x=1758869113; bh=XahiXgnqjlvzSXx47tbWcSBlw0Mq9r1mPW8QdO+PC1I=; b=
	w8EtUZ2k00JfHN+O7J9TJ4EXZsE6j72zWe/OMFttO4C8Jgv+y7q9uc9c0rKuIvqx
	q6ABjfCvDfKHSFhsCLHZVdDt86n5ywRzeEWPkGbbfLkHSGGu837KcSK3faX9n4ft
	pyErR5EAwD9h66Gpwdz4Ip6YE6nmnVTeYV11SfUreq8TLSSSp1Cx3kS+SX+MLvJx
	lcVYb/iz+ZAwdVSB+fildWABjc3SfMfWOgQDToy3xK0YtAPVgG2daA5QrrVugkvx
	qbW202PqL49WietFojSUBifJCftGlJM7fZPUp0wq7Y1H3ZQjyk4+eP+5vNqBX7DI
	ClDS2lGM3N1+EBZYlih9EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758782713; x=
	1758869113; bh=XahiXgnqjlvzSXx47tbWcSBlw0Mq9r1mPW8QdO+PC1I=; b=N
	8+L+ymx+MFhULuLGdBroXETAyAJ2WWPDbLlUGroAbz4Wy7J6Cin2orR8nSA+z+kR
	BToTG6kcXik0UGwdmttuqY3Fqbxup9z9DPvS4mOed9IkHL6Za+l8OtBWajTLVbex
	XtpOuPio9lHt7ifnJ7GLtz9pPwFJ5+qQ9DBMaHZ+ruJP5dANIaSsPpWZLbtqnfRE
	X8k+6PpSw240GuZ+AqV1gg5mIDFWQRE6lLfRssA0LMX0i1T5d+v1u1ckWXgA/kS1
	/ftIjTCpqtYJkhMxt71Zdu7uro9VcHUIYjmnKnQ6lCVQGHh36hDZ1bWPaGLt4iCx
	3d14zw16Pbr2YS27cyHPw==
X-ME-Sender: <xms:-eTUaOolgLShNDpX2kgugLr8UTiSYs39U64K5_UU0IZH4xUi0UaMNQ>
    <xme:-eTUaHc057eBkNIRo1s3jCcFNcE-hh4zvvmAbDuHmoKtly-dQnKZNIi7Jg3uye8sA
    OhAuhQi8-FLtDec5VurpsubmBPG0JWy8qk8XtXQQdA6dcy_VZjSUZZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiheektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjvghnshdrfi
    hikhhlrghnuggvrheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:-eTUaDLA56E93sT9smyxvFqK4q50VqfGCT4lhjr7W0v93rwH8Wqlbg>
    <xmx:-eTUaNJgBYmqc6jnWyhDH7aO_LSme1LPTbQpae-Cjfaqko8iOKocZA>
    <xmx:-eTUaJXbJ75LA4KpoUlE19a0kwfvPc_S0ekW8cXLjH-5TttqyQH9eg>
    <xmx:-eTUaHildpE-e7m0s__9Z1Mx-8Rfy_j04XKc2sZZb51wjYhCVKuFag>
    <xmx:-eTUaATrUFcKErt3IzXUwHDsYP7rc4AitQlkmxYkoyGE8lX7bGEg_ARI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6ED50700065; Thu, 25 Sep 2025 02:45:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AhFleYJpHohR
Date: Thu, 25 Sep 2025 08:44:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jens Wiklander" <jens.wiklander@linaro.org>
Cc: soc@kernel.org
Message-Id: <4ef734e5-283e-4bc4-84fe-bb6241c69942@app.fastmail.com>
In-Reply-To: 
 <175875181113.2716298.16465530311161198160.git-patchwork-notify@kernel.org>
References: <20250924083404.GA3747732@rayden>
 <175875181113.2716298.16465530311161198160.git-patchwork-notify@kernel.org>
Subject: Re: [GIT PULL] TEE fix2 for v6.17
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 25, 2025, at 00:10, patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
>
> This pull request was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
>
> On Wed, 24 Sep 2025 10:34:04 +0200 you wrote:
>> Hello arm-soc maintainers,
>> 
>> Please pull this fix in the TEE subsystem.

Hi Jens,

I saw this just after I sent what I expected to be my final 
pull request for 6.17, and that is now merged.

I applied it for 6.18 for now as it appears that this is
not a recent regressen, but I could still send another
pull request with just this one patch if you think it's
urgent enough. Can you clarify whether the NULL pointer
reference that gets fixed here can normally only be triggered
by root-owned processes or also by normal users?

     Arnd
