Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE905341068
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015906; cv=pass; b=U2ORP6deO5/HQU1aRUwqH0RH4gvqnpx0j3GxfdSU7mWu8JKE0nNRAYUekXyyQE0wzl7dym0dY2trpHlSA3wbsqZdAPreNLfPqaIvoOi4zsurUfsTgnLxgFvjgv4ukBnD0ppJKPsfF445ehe5o8jWf/pfodHB1vGMKfA0AA5q074=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015906; c=relaxed/simple;
	bh=+3m6Q0vea17holrdpu1NVV1rh4sQm+pmpyaZmWr4erE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tujjQb6omJhfE+f8esOplfX/NAs9iHpgi0nST0+WgSni+BoDeoG2pkg8DDT9uNZV3fExOAtXaTk9+lTWgDC+i6om4YUQA3uzRybxaxKWZBJzqAdnB+V2N+V30C91ZIH6HXqTH+VZioNv8IXtC9k9O0NP+jy86wpKXqJZtZPTSCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FlfGOwzG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZuSsEXRi; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FlfGOwzG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZuSsEXRi"
Received: by smtp.kernel.org (Postfix)
	id 9EB381F00899; Tue,  9 Jun 2026 14:38:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781015905;
	b=aeuJmKrGZ1IpwSLajVCdqXInlp1cb1bSwGfmrk8OeGiRc5SR66wfm+rFcnauJSwuaG+P
	 glF+xheHSrlo3aEDxizRJ6MycQU8qqyruq6fP6EA/UwST9QCI2ESHl7vjrdEJ6TUhDCxa
	 gqRqPjPxZ+pmoV/wf7fwkNom1vkXXdwvNi9XzuL3nVF2lvEsMvtRKl4Cr+yJOs++wHyEm
	 y3kuR9Ca0nEEcopGbC4Ov3JJBapEsqPF8be1a/cRYCQSNZtDBH4Wmiy5eCceRfFEO0v/w
	 7mfExroyX0R7wFjVyADDets4HFwPI0PNoZEjaemCIPbNHXwYiNforWiU0xE1/4FPpZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781015905;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=OQpu1OhWPmLhgQCfoB8dpZ9HJ92662GsLDeWYFfZD/c=;
	b=xOYJK0R2yD5zlEZmfqafo3j0TQbnkrcaUGXDjXzPvHPOILFbETqgJMVQftnhQOeW9hlA
	 G1ShMv8g2RR8bL1V4frBnXx/kZIrQPdufsqa/86piVb0i+iDAwhVzo5jl7yjRkEce8v6F
	 wZDUd/wEXUB7zscpzTQEyv6Gjz49GmQwiIi7fwCGBu95IXQRnzOGZ5e9G60CSzm2SbjN2
	 Wv+sTSPVXtn9lIUZytHZcqXdb3evrnFKr3IUYJXQ2apHOCi4OEfsUcTotyS6FNqVPH4OS
	 nXdh4pZ6li8/4nRybYKm7x4mcmjwCOxulEDBaYHlsL2RyGus236/Hfu5ibJ1LIo4RyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=FlfGOwzG;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ZuSsEXRi;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A93F51F00898;
	Tue,  9 Jun 2026 14:38:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=FlfGOwzG;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ZuSsEXRi
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A93F51F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id A8C7E1D00108;
	Tue,  9 Jun 2026 10:38:23 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 10:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781015903;
	 x=1781102303; bh=OQpu1OhWPmLhgQCfoB8dpZ9HJ92662GsLDeWYFfZD/c=; b=
	FlfGOwzGAo4KLfS3a9UDfQgvgvsMVtAWe0VHKf2094vgfx28DwmI5w/JMa379O/1
	b5ToDqNjmSSbVTkRsi+gdt3s8X7rDZcO225BW/cJ6ZHQW/PLPdWEmMPWC1D3no15
	xRhNXiyB1oDimx0vvBibUEO84xd++meXtt1ZdlFVSJ+JhlqOWY5oEyNmBDKMRPzQ
	ka9YgZHvpibjkA3Ym6I8BtP8/HYdnPfkr4SAzl9c6KI3DHFlv+Y0fT/oTnNcs8FX
	XJIt7WrbcuMRU0f5MC169vpDFcR5aENaos9ZFw2FOWYC+JmhW9mcOVX4VKMLZ38S
	gMzdBSxgKvZy1cP30+B6oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781015903; x=
	1781102303; bh=OQpu1OhWPmLhgQCfoB8dpZ9HJ92662GsLDeWYFfZD/c=; b=Z
	uSsEXRihfmEOUbNXyyzlD9lGf8bwbihB+p+m7QZwQ2pRIZ5wmdChrOzp7MeK1HZm
	hTDwT4eWV0cIT3Nkgb9iJU8EuMMaHD1ltY9tM+NzEF6cRfF/JpuCiowi9u/UQnLx
	rEpJa+LhD9nacbkpQYAHeVRiig8Q8eU2lMuQadafP57pGML5R6pOMsMt2PtA17KL
	Fi9952rSYFVgcB1LpZb9JPUEU5HCooucwTCulTBvKfuXUyqeMf+7W7GSNTC2QLvq
	9PHLmncpg7rgM/g8XSrh07jxLNA2BFrPi7ThNxIrPXdPoGGQcLJcpzp2J6bcdCvX
	9rbTzvGq18jPdwrXcKPwA==
X-ME-Sender: <xms:XyUoak86mUy0BYaOQlug-VUWM2yVQGXhrWFnMQ2UY8SF802vP2G_Ww>
    <xme:XyUoanihA2ZaAwd_4eRMoS_aHd5iGseMc2rQCcsBhYA6jYD5N0c6kVhUZYogom3mo
    _LuNr5uwkEWV-mHNRp4uNmaKuKvOY0mqRvYFPsM1gMVJDQ0cFBtE-4>
X-ME-Proxy-Cause: dmFkZTFYUZGOq/AvS7Q2hJPmVjv314Ck0BIhy23s9lgogZcHS1ANaQJSO05P+xI2m+WrIR
    lS0w8oye2jIfpymb+Xyu+duM38FHTA0w5MO9K0uFSW6i6r5TZZv2HW1r8H4iPH2gwKajXd
    ybcger4XpWtJzJzXPOUGlxTOi3xmHRqzWMDhXj7CprbXoftoBaiyX62VReqrV6f/ukiGXl
    DuYkbc+aL1lS+ysovuDQNGVYjo1eWZTrmxXji5PPnyWIU8Be+oNKrKOyWPmnJ0wBAsSleZ
    twTroz8W1RaQWvJwrpO+6fAiuH+t6Q8kwt8EeEHS+/1laRcNeAX4QsUMcejITyWOgWXFnS
    F8X1iBZd8rz58KC8Y6q4D8PCPd+l2LaQaaFitxkUTkzfTRttzlQ+jy0XGpG/4zReZ6hDDk
    mMccy5K1kaqGdLfKVYcImaF1Wu91WfsjgMjfOO/MmXqW2dzO+PR7K+7tIiRqI+3/FE7ga/
    8qOSXitySgUQZ2JqsLqOI11K31Jx/PxFuHJ9YBPrxM6YnqQhvKMIrsbvl4cpcADleQ/UHJ
    9yEPxDezdFtmTHlKmlM+7pEsbGAB80EiZ06iTYzTVYquJ6R3H8GX5HCHMVUwUJdD04c+a2
    AFZ+P9oZOW8dC0jkOWmWjCU9AxH+CodVXJh5n90lTRlDnjjQPoseKq2auwYg
X-ME-Proxy: <xmx:XyUoaulhNvs6XOCpyY-0yWjPT6_IGL-Akc6hKsWC54nUxBoPyFw4Qw>
    <xmx:XyUoav5lOHVcwXLMM32Ol2K4KaZ_X29CE1guqtgQ1QXUDn86bBje0Q>
    <xmx:XyUoasj8p1IgzrX2TxbttAVsYUtkxyQWG5xe798aoy72z1fAqLTNlw>
    <xmx:XyUoakFMayXJxA1LLaVEZDFlW5YqAzN2CO54YHxVBeNogLqk7cw7rw>
    <xmx:XyUoaiiR3g_UTWdn5fFxY7otM63eK8dJgglpMd__i7KDr_Mi4GX2YT4a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3BED41820082; Tue,  9 Jun 2026 10:38:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AJX4MtyQJOMN
Date: Tue, 09 Jun 2026 16:38:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Sasha Levin" <sashal@kernel.org>
Message-Id: <7c575b6d-5543-42e8-9b7c-be1e7148c454@app.fastmail.com>
In-Reply-To: <20260531060825.1855391-4-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
 <20260531060825.1855391-4-thierry.reding@kernel.org>
Subject: Re: [GIT PULL 4/6] firmware: tegra: Changes for v7.2-rc1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, May 31, 2026, at 08:08, Thierry Reding wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> ----------------------------------------------------------------
> Jon Hunter (2):
>       firmware: tegra: bpmp: Propagate debugfs errors
>       firmware: tegra: bpmp: Add support for multi-socket platforms
>
> Sasha Levin (1):
>       firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol

I'm merging this, but I would like to point out that the third
patch does not actually solve a real problem and the patch
description is complete nonsense.

Looking through linux-next, I see two more of Sasha's patches
addressing kconfiglint 'K002' warnings. I have not used that
tool and the warning sounds useful in general, but all three
of these patches look like false positives.

Sasha, please try to understand better what the tool is
trying to warn about.

      Arnd
