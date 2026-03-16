Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E207F2836E
	for <soc@lists.linux.dev>; Mon, 16 Mar 2026 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652366; cv=none; b=LByOC7HweLAPWy0nYZGBzZqwTzPb5i8YSUb53DCcylK4WLL97xfZ9w1St8K2h50VrTStPWksp0zIn82mb0dKZGTV3U0ViQLIV/PUcsBjkD0TFfTirh5sqUkRt4TpkrEilTmWOYqgREpMUjugvnup9XWB5OThI+FPKjfC3NZAb/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652366; c=relaxed/simple;
	bh=go02ixgSL20Ux92tuJRbD1N4w8blsx267fjWxefHE9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SukkJNlD0JMAeIt5ZUujFi9v4Ip2f/qQTxzKvCkCHRKO9pU+zrUzSP8aTxxBFeB1v/7b8eLLcFoHb2b3uV9iCNBgtl75cs/6uGOu0rko+sXUJ35nxEP2kv1WIfRS2zTGxDuso8DdPdq+QOic0jVw5OyS7d7PhjO4tdx0iYxlmGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sl7cOmPx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sl7cOmPx"
Received: by smtp.kernel.org (Postfix)
	id A7EB1C2BCAF; Mon, 16 Mar 2026 09:12:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36B80C19421
	for <soc@kernel.org>; Mon, 16 Mar 2026 09:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36B80C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 267284E426D0;
	Mon, 16 Mar 2026 09:12:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDEDE5FC4A;
	Mon, 16 Mar 2026 09:12:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80135103680A9;
	Mon, 16 Mar 2026 10:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773652354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XMdyJKTxV9bkaRt+aS+VoCDjmIeGU1rx1qmRc6qB+O4=;
	b=sl7cOmPxOBByV2Wg/r9auwL1PSRhZ5BhyW7EYgNtKJjC5vkTdWs5Bda+nDMzbykfNj0OWy
	GVouwCYuWsT9pONEmnyovcdPq+s46bK7P281V1Lh53fhgD7cOdtfhODVkbPX7vDWa+u7sM
	M2Aypbq9t65k9dGtVIXwnb2QRG4dFPKSSWYExteVnOFQ2FuHHTxCW3JeZGqKnLOQgbYVQz
	diQ9ulCLwTleo7FBxYlvR9JBp+n9i05yZ/qr1JQHPwtR1Ed7gpALebf5AE4Xqc9Y5hudiA
	6DHeY3l3TmyDTQMGLQ6KONrnobcMvomSSm95DMCjdYqpWaVAyqAiAsGJ9qSvDw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, Andrew
 Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
In-Reply-To: <20260314-illustrious-origami-pronghorn-964508@quoll>
References: <87sea3680w.fsf@BLaptop.bootlin.com>
 <20260314-illustrious-origami-pronghorn-964508@quoll>
Date: Mon, 16 Mar 2026 10:12:30 +0100
Message-ID: <87ms085e9t.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Krzysztof,

> On Fri, Mar 13, 2026 at 04:53:03PM +0100, Gregory CLEMENT wrote:
>> Hi,
>>=20
>> Here is the first pull request for fixes for mvebu for v7.0.
>>=20
>> Gregory
>>=20
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f=
27f:
>>=20
>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>=20
>> are available in the Git repository at:
>>=20
>>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/=
mvebu-fixes-7.0-1
>>=20
>> for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:
>>=20
>>   dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0=
100)
>>=20
>> ----------------------------------------------------------------
>> mvebu fixes for 7.0 (part 1)
>>=20
>> - Add bindings to validate the device tree that has already been merged.
>
> Merged when? Why is this a fix not a development (e.g. documenting
> something 10 years old)?
>
> Please write informative pull requests. You want to here provide the
> context WHY maintainer should take this as fixes.

Okay, I will add a reference to the thread and a summary. In short, a
new device tree has been merged without the binding, which caused
warnings when running dtbs_checks and annoyed Rob.

Regards,

Gregory

>
> Best regards,
> Krzysztof
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
