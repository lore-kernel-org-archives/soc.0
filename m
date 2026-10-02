Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0938D3EE
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977071; cv=pass; b=VQpQOU+w6da2lSk/mZhcyc07+WpiFUDViMRgzFflYQXFFBwvf33rGD7U+4cJqilOLuUSChZ+Rv4jsaItbeC7PEYXQmHx7W6mXt4vc+prp4iCUuh/PdZGQ7VA2/EjyU1qY5ti4aj7nBIhJUC/WlTx/Mp7J1/YdiDqBSeLttNl5DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977071; c=relaxed/simple;
	bh=L5kRDBGbJEWLFniVA5klUp6KVl585P/vFsELwXj8O0c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Wv6x7wUHdyxsQoZ+SiU29+4ViaXPD5u/KKJO6On1RNzUmdfEn7oagm54ghu0J+2mhm+bYA9j0QuJJ7X2Pa6zCyFCZCVZ60Gb4D+98dclrZ//W5PqbtFziJ2hk2Zu4ckVuIERAruZTj1NrYSxNRmELuEcS2RHWPpzaQ+xKiOHG60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lfmeDlcR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QuKe43pN; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lfmeDlcR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QuKe43pN"
Received: by smtp.kernel.org (Postfix)
	id A2CF71F00893; Fri,  2 Oct 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790977069;
	b=jamoM2b8CoRH84mT2amUYHI1UzqDBlj1hAVA766xTIpyUeJURiE648bbxQ7Bjql4CqWE
	 u2cOQf6jz1lfeWmEdiDouYH+5Jq5ECuQQnibCxV9QtAXJCz/WLYzHYH4S6ClR2mEsHqYQ
	 i5a4Gy+XEvSBQZsI/cRLattUvdlVScd/m/P8bvb/tXEtr9a3vYBPeqK2vJN9Vhlr/whBX
	 EGSW3azzaGpiZI5bI36W9DZ0sNPvKp4rNEUsxHbSI8FXD4ZrTsz4wbUbQ7fUqc4x5Wb9d
	 kruOK0Dj5cTDHm6byH4rRhUaf/Fo+BKKk2yfAuGJrOIPAc41WgImJEpI9JGb/3yFYvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790977069;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=zevCk6HADjWKObcatFxpYNNeyJpHnk8AZJwqLeDeBMQ=;
	b=QewNTBBr7GbMlMi9Zm/tuUTeaRNrmcNIS/j+Z+0c5tJgV8YBLFMj8KtM3YbmLOFr97sm
	 8oWZvNn69SwdQ+G1YmFn+aREKTLTm5v6pu1Pj4EOxBAY4P5HBI2Umy/8kcNGShSnoKsNY
	 fLnQ//bQ05X4j0jjuQXVIus5U8ltyD0rH3DZ4JeOQdf5Wg/bS4HZPTia1mWnfd2dEonzD
	 qLDwNWYFP2RLdIEIggzS4ikIXjwv/EN0RNT/DecOk6zUzXg7dznmoHTv9NxYhc10kDuhn
	 pnU3Bz4LVUf0IGOO8Bnicw9Cdx/geHw1jVoGmByZ3b+HZKgrIgZPxTk6azPZFa4EpmA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lfmeDlcR;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=QuKe43pN;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1079D1F000FF
	for <soc@kernel.org>; Fri,  2 Oct 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lfmeDlcR;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=QuKe43pN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1079D1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 30EE1EC014B
	for <soc@kernel.org>; Fri,  2 Oct 2026 17:37:48 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 17:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790977066;
	 x=1791063466; bh=zevCk6HADjWKObcatFxpYNNeyJpHnk8AZJwqLeDeBMQ=; b=
	lfmeDlcR6pQiomPnBTJgvw+ZKUzYS2NeaUKFc40ime5BmsRDuu27LYRMlu4lcyx0
	pjX0guxXP1+hXHJQXToFkO8vjQNN0eud55o+Uf5u4cb85RMzbB/kcEv22GdbOSEm
	9Q3KcJyyQreHl7Dn+lkExl8NVxlA0uPNK8IQxxEe0FDCZcY3Sr/BIs3plP7vmpDR
	OfOFRMFWbhrvDv3L83ivo9we/qcSCKtoYfyt21NkHDB5mv+AE4s/mdD5aZT9w0ET
	iE7wBUHidhRspmWSVic6hyOncCU1+SRFXJ2wfsA7nbkrE/Mcmu3BGg0QD3phduvF
	DWA1XxaYNVv2tLiFBeQQpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790977066; x=
	1791063466; bh=zevCk6HADjWKObcatFxpYNNeyJpHnk8AZJwqLeDeBMQ=; b=Q
	uKe43pNnfnoIw9JVplJ5XbaQlj/ttQmHF9mUgftCOhE43ZL1jOWcP47S+LbvXOE7
	Sf/cGW976fVNDpHi0zkaLFHr3t2xQtCNaKQSRPivLmo1htckS4I42aUnk3qrcHQT
	oF/RzXmJUg/NOuarLSXnBtgAwJsRyA1qkL4+4ZyTDtic65/2FD5jXiuIO8CZp2oF
	2yKMqdZr8Bj6n4SGdSmE+Abe1CTxtWZWsRcSF7gBp+gsI/QBSOAQOeYeAZvo4w3l
	kobReFWd/9zsKwcUQ1C45Nlvtlzn7GDsta/N2dFbaS+EbXQm1WRnK/zMmx3Eb8eq
	erj8CBYtrpDCznVMw9FNg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790977066; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BrZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:B++r3N3rtp43RceMFcoNfog4ZzNa90HeDmOD+qVb0Sk7Zxj
	86Jlru7+KXBT0PaSWkt9TlvAURZgRaaDgTrTwkDyHFBgYqrctgjKMNFHQxq3RMz3
	xEyEKofRdczEsni6aJKEEL0Kp5y9hUP3Ik7cwjwiW+P9rDQdPnqK+3KNGj3G96U/
	w0xeJzF4f2QUfd3KdQrmGHI5dcwfPAmv5unPP2swlv5Vjn6OIIjlvEJmypI38rAs
	tumLK8A/3IVFesfRrE7d6T+hAL3SH86sqlTMeJAbjnTRqSpMHyRsZGYMFVB4ieWD
	MrAPKW8Eetk5RDZO1rO29KQmpIUG8mrMKoukmFg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:t0VYZ2kk2MbfX0XbY5mtiCu25PX+gIW2dbAKI6Ibm3E=:L5kRDBGbJEWLFniVA5klUp6KVl585P/vFsELwXj8O0c=;
X-ME-Sender: <xms:JiTAasgCD0rqaAZ-30bC0ML--mDPmFYvB3OZPzob_jKBpklBk9rS6g>
    <xme:JiTAav2y0uBj_MyyUxDkOQBdiDGnH8y_Tu88pJquh6S70LenC6sdkNj7sHWLuPH1N
    Ez1ev0m7_E_hER6i-z_T9sfoK5mD5PJaj60c7wRnZp3RLN1Kfdru-0>
X-ME-Proxy-Cause: dmFkZTGqXiRZXfmHJ61JP0i8qg/CxGQKFD2bFQRKvgHTM5Zfuy1hHnTCGEcoYs/dOJJcQG
    Ynic4rG11iYNagoe/MkkGcyoChlJQvAJ0GK+2g6w7QBfE/dixaVfkIVnQ50kci1R4HzbTo
    KRcAMGR4PJKcwoNXl34ZNY4Uswj8rmlUfnY6CvwKw1j1j/FfdwvKJ1jK7nEZFCCa59IgpR
    4tFPFbsXgbq1tBMKKGXhai7PUB/D9Qbyu8+N7T9q+ZEIC1rUPmFGbkLdnYcO835JF1xbgk
    GJLhUdHHfMiYYtkGOcTdMFZRG5Aw8lVdnXOnz4rHkllAhuyxXt3KGuvlFE9wEqzKGzpHK2
    PuNm6p5gDgeAvPsLYdTJydjGr7rLb0TrBSrNS56kFxbtpa8KgWyzYZfacOsrZaJbBuFkL3
    aVh2c5k7muAbuan8lZY8FXRvvK3OsE0a8LcPXCgRLJIv/rlGCJmBCiy6Rs2BRJFa14QN0+
    q+ghJNB+2mPhjsIC5QQdU/hh6cl8tXVvuqD8IGN3n3YIqZtIx1Ha+Ljj3IDJ8tWr0A/SNx
    B39WKDfT67jCmsS+AhTTUOYgCU+qQDmYBja7URRNo/aRwocR/rFzfsCpgCbqIUWPTt/MEd
    2A47tv4hW6Rrs1ufagdFPZEQ1+n7YrzPSBJasQQovcKxf8WxpUHEJwi+OLPw
X-ME-Proxy: <xmx:KCTAatGcdtwTTpiO0Q3xR8LjkpHSYWpjCJ_yspd2QPUiNelaOrYURw>
    <xmx:KCTAakmP3jwWXM4xR0IajFWRnmRt1ItvaqHZQ8NJRS7BZGvMHFUHNQ>
    <xmx:KCTAahZ0DjBOPy81v3KDX9fxfcyN9Hb6i7cKylNYvwgs24O8eu75bQ>
    <xmx:KCTAapGfahl5SZ8E4AIFpWLdbI5oI3ukUYiFyZYY5isQ0SaVe0164w>
    <xmx:KiTAalGJ66fJRTNQ5CVGxIroP08lXXXOYMJzieLz9d9lekt8qmnp9f1q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9E86032A008A; Fri,  2 Oct 2026 17:37:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AD7zrW3c8eHJ
Date: Fri, 02 Oct 2026 23:37:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Sumit Garg" <sumit.garg@oss.qualcomm.com>
Message-Id: <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
In-Reply-To: <20260922130653.357615-1-andersson@kernel.org>
References: <20260922130653.357615-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> ----------------------------------------------------------------
> Qualcomm driver fixes for v7.3
>
> All clients was migrated from the Qualcomm SCM PAS API to the Qualcomm
> PAS API in v7.3, remove the now unused direct API.
>
> ----------------------------------------------------------------
> Sumit Garg (1):
>       firmware: qcom_scm: Remove SCM PAS wrappers

Hi Bjorn and Sumit,

I was running a little behind on the fixes merges, sorry about that.

As it's getting a little late for 7.3, I would suggest skipping this
one patch as it is a bit large and is a cleanup rather than a fix.

I would instead merge this directly for 7.4 but still take the other
ones for 7.3. Let me know if there is some reason I missed why this
needs to be in 7.3 after all.

       Arnd
