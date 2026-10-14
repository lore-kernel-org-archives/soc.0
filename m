Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4848423F
	for <soc@lists.linux.dev>; Wed, 14 Oct 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962854; cv=pass; b=a0JchB2huyXCE7MOhkmg7Idqd2E7UbrsBWL8zh5IOeNOPmEiG0xu91a9IYzge78iqvW5rDc2wrcC2bTzdDORkiSZtLLbARW7Aok34z5+hqV2S0NNF0bpvVPUIGaBFaSxWtXm6R6acHai5i1y8rnNVGdZ/IrQzE97STDaOD87NzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962854; c=relaxed/simple;
	bh=HRxrwIUBZRmXldw5m1oBuixwII+vhdTytUtj92PCdLI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nUWSk7TAEE5urmZi6uEMYEVOfpdDF4kbmQEewM57LvxISLOqLvbcAlS7WQ5t2QGVaM+0tv3rB5HAiQXABVFZtSoV6bMareNajVMZocBTYN1RR3f6iHYfIU0mqxxJj4PV7tFatp/Lriv5xovriXSRZ4/741C+OmHFXVdonQAjxSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KGzxjNVe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZtZTSkyN; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KGzxjNVe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZtZTSkyN"
Received: by smtp.kernel.org (Postfix)
	id 1DA4C1F000FF; Wed, 14 Oct 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791962851;
	b=pe4vN+8pbWlciQt8Tj6IeG1ofJYWdaTB57fQvrzUHj+oEi7ePKi/WGeCWT/Mq271WDLS
	 yuc0JevL0rEKOT9qYk14JSD5cp4m0IGZOQAKSXmfBHTZLm5FdkMCAkMdyCE9KEZLZMdOu
	 xCWatXxfEoFJhKG7yQxOmAAzlImCQpfM7dJISW8qF6reK3BwAQ0rZ0m4m5P8ZZWkoiFae
	 xcBkRDNSOT7H461QzAqrSx8dOVtghUPHx/R8MjMuAn+aCvTN9m0wR6EdrT0KQVb2cGQcV
	 CeeNiUNKIjtp3IMQNwPvYDGF0DWTJEv/u2R5jbHYJFkJWED+rys4aQq+n7UbmKlzoyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791962851;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=e0RNj3fGETD5/YptLsnbJSXnK4XfQIs+ti+07PRN8uE=;
	b=kXRpxu3rxNGR0xjs1gzVRnWMOOkDfnDJt9DOXQrcfl8MrvNHQOytHuee8B7/XReFTIhH
	 8RPNnEy4hcQP2vggJSNEbvnqy1MHyOLWHkv06niw8P8mBQqlNGE8ghlrzklBCEIjASIRi
	 4mM065hGNlAvkEii2N8uVbfpJAWQ/CiwjUs2k2FBVDNx92A5843bOfNIU5MdHYBGgVTZ7
	 OxiPQtHfm2ZVgiMdv22lWWC5klxZUOhpIdQCKuyJULLbMvri/Q08id5Y5GW9iOE9Msd/K
	 V9s2QZV/BomxIMKZx+rFkj1uFdx6ScaFq8Qu14CTZ17zOMsuCwegPSq81VHeYqvjxSg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=KGzxjNVe;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZtZTSkyN;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D8E91F00893
	for <soc@kernel.org>; Wed, 14 Oct 2026 07:27:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=KGzxjNVe;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZtZTSkyN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3D8E91F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 72271EC0041
	for <soc@kernel.org>; Wed, 14 Oct 2026 03:27:28 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 14 Oct 2026 03:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791962847;
	 x=1792049247; bh=e0RNj3fGETD5/YptLsnbJSXnK4XfQIs+ti+07PRN8uE=; b=
	KGzxjNVelv+bREwNibJ2ihZJgPFft30jpEXd+xL2FtwmCiCTqZ5K3Hk/WymvH2VM
	95EvH2OmP1eJIJk18fpXVntYMD8BqL4hEw5wzLaeP3Ym7sKoNtV3NQmbgEcDRnnX
	mKyajuiK67PRxEXb6Cwyrf3wE95uyKXZ+ikvmQtg2ckDhgNP9of7qxIq6dJ1jMC+
	YhCGJ5ppvgqmqupiWDhwjVKgYpxfb/Pw4UZTkbj4i7m5Tz1qQJXVgs0NZVgZl3Uz
	6F0odcldzxnykm5EhFHdYuS4qt6dpuPFixwmoDlmUmriov9B1lSWFLZPwMSl+IZF
	Hsp4YU+9nkc6TIRv2ObT4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791962847; x=
	1792049247; bh=e0RNj3fGETD5/YptLsnbJSXnK4XfQIs+ti+07PRN8uE=; b=Z
	tZTSkyN5pg5QU3D4aKwP13yu0ogLD0qQndfS37xKe2700yZmXSevlfu+baM2Ac74
	alShfw7r3YVqy4OaD/qGRetMXioiSjwL9wB5HQd184Q/MoTnn2S0F9Ce6lkpOTqq
	PFs5XIIKWcAUtLdnjO80ZsI3+zgVfQmTXeCBwLiPh3BpBtFUqkaoAKehgO8MbiTN
	WOkM+AC9hgXfoIcWoIKAPIrWzGrmdGqAZIHiNELu9F/i/zw+5gsynae8GdUfJXIc
	FqUJ/isscwkfNsO9AXT1l0bPBHPpAuIPGznQBEKiZ5YSmVyMyxJ6Jy0Gyo7ipkUM
	7hhk1oeUaBIN/mVkT4EJQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791962847; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BrZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:AIkvtHMeQqg+TnD3jyvee/lqMddDK/okII25QhotJPOBkqa
	aZWazQv1lQQ8cFZIygoROJ2k0gbpXMbsQOXjKatVpBWNQXQmf9COm+kL4+Ik4Gs4
	he1EmjJ0mtYX8Ek583gdoNQKOpuz01QrzzUraTtdHuxAn4fPrIhnZvPk5wCbhTzA
	YndnT6pz4DwnkrghZ+NN7G8J9OioU5XGGmCk6J9zoEZg8PdcNOd3zA+vJWaWZnuh
	6QBqXDScNLL7L85XsgohnQUW7oRMbeYSSXLwXFs9/MhMyYYJbKiTx8xI4Fe1eCTa
	j+WGPkaWrng5Ji6xmn7op3WQSHWazccL1pq7rHw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:OLe6nH4iip4hjj8eE05hoGLrGiDAkmdmTpSeVyaoLVQ=:HRxrwIUBZRmXldw5m1oBuixwII+vhdTytUtj92PCdLI=;
X-ME-Sender: <xms:3S7ParF4I06uActDtq6PdSeIrvNmIOGGPxg4VVuXcwZV4pf7irc5FQ>
    <xme:3S7PajI9RMCidsqFi2U3EDzI23ofQwXqJEC8EEkGJBJ1nvMQ-807FDfxlfuVubaVx
    oCH1H6iZuT0u2QxC7Y7UULZ6n3Vs4bUCQ3k76xKz9_zlCyM0mbfCOMr>
X-ME-Proxy-Cause: dmFkZTE8QJq7XxDC0HnW866jZQn5k+EgU9Z52F+AslokETW95YO3TCxI7mgxVTakImw9kH
    NRClg7hg6CO3MYK5587AETivmvxohW3so5XzWg17n1Oy1LODV7577JitD+oMEMs8eOuE7W
    Wy4G+Js2b8KUJ882ezi7dVKJ9RewFP/JcT4Pr7M2TwabOXJWUtfKvvKC8IC7i0/Tb283SV
    VWofG+0jfYcO3c8CqI7wmj3f8Z733NZDYcndKhuuDeC1QSShnNMngtaDJ6ODb5blFAUlkI
    teLHB7mW+uZv0sZcgtebaR+T/KJn1Oz+eJjyri3hv+epdXMKMuXLXh0WboExnPMZ+nRzGc
    y3FZXQgqMeUhPtMt/d9j5nRSEh/zaI17WjJFKtazEWJT4JF7WNxjuIF99bzUaGXZAh/4QX
    vuQ2m/Rdi+Mgk4iWjtjkwaLfLQfJBpmTmAWGcpaYSLFFDp6djojNthdeXqPH7yaHJbr6Rr
    oRrm7EV7mTsK/7gWqZAb/qbuU8n3FYvE1SdoBzI7fCkr5hlZpwTgjhArS24WTPXs65Od97
    sJ+YvBVEQ/KXp0QQ0kDZpSEEGfHz/mvkpHzNCMBH5pCEZqUNQ+LT76M77TwD0VhvbpEEPQ
    YNn9WO3nIxklcA5MJbfBNmZqsZWLYiWny8Ky5PeHc6io5bWaGRvVPJA6Yqmw
X-ME-Proxy: <xmx:3i7PaqF3_K_xKqWTa9Hw9KVUneXpyPz85hMgNoX9Ni04POvTrCFGNw>
    <xmx:3i7PahU1-YDJN8e0OLoPUbv70Uj9MS4o7pOQaiRZZH2zdkWBMkCQsg>
    <xmx:3i7PahxucSmpVItg2nQX_Rq0FDNYgzgo2q0T4GVRU0X50SSv32epSA>
    <xmx:3i7PavNS439VUd35x7hM6Vv7tO_U5Skw2H2b_X2sji6_xeFfBrHJVA>
    <xmx:3y7Patmvn3HidYgfbLPny-uzoT6DP4oi4-l3lebns-TZrEHd7SvdM_8E>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D93A832A008E; Wed, 14 Oct 2026 03:27:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AiF43aUDa7Cs
Date: Wed, 14 Oct 2026 09:06:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: soc@kernel.org
Message-Id: <93418744-ba09-4031-b96b-24fea70d4cb8@app.fastmail.com>
In-Reply-To: <e47367d1-9c46-43fe-b657-28358def2804@kernel.org>
References: <20261008164735.566333-1-dinguyen@kernel.org>
 <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
 <e47367d1-9c46-43fe-b657-28358def2804@kernel.org>
Subject: Re: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 14, 2026, at 01:33, Dinh Nguyen wrote:
> Hi Arnd,
>
> On 10/13/26 11:10, patchwork-bot+linux-soc@kernel.org wrote:
>>    - [GIT,PULL,1/2] SoCFPGA DTS updates for v7.4
>>      (no matching commit)
>
> I see that the bot has pull in the 2/2 of PR, but something may have 
> gone wrong with the PR 1/2?
>
> I may have done something wrong? Can you please take a look?

We tend to pull in similar branches from different submitters together,
I only got through the defconfig, drivers and arm32 branches yesterday,
the DT branches should get there in the next few days. It's a bit late
because of lpc, but unless something shows up it should be there in
the next two days.

      Arnd
