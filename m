Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B44D1F03C4
	for <soc@lists.linux.dev>; Mon,  3 Mar 2025 21:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741037196; cv=none; b=RjPnJedl2Gtc1iRfsmAAFMWH7yuIJOvXcb/YPjZzXfjMyg5qAEq4zlRKThyI4vfNk7fVgrzcOl//oVaenKBIo/U6xq4G+4LnFo5rq0R9wW58JalZmDd/sxAeHqqW1yB0lDbgcg2F4AvnkzRMaKg89ID3+XyF5qiSGJ/tJ+65hIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741037196; c=relaxed/simple;
	bh=QieX1f1ZpVBpFqEYiQLHTccw08+B74/nkI53Ml21MeU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VHVz7X14Kb4yUbBZ58bBRwv+2DkC1hz57hbPydUiv+P3rgjHOwXnk3ARMRPE7cjUdJqQ09g1fW61Nn3aA57qp0RaxzqmTWcHi6dS3/2kk+a1DnV6W6gf/8uaTCaYUhopdPSZgBlHcohYHCcl8zY+8PaTcNBKY71bDm9wo4qbENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (0-bit key) header.d=mybundlepay.com header.i=@mybundlepay.com header.b=WyDy9xS2 reason="key not found in DNS"; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mybundlepay.com header.i=@mybundlepay.com header.b="WyDy9xS2"
Received: by smtp.kernel.org (Postfix)
	id 1EF17C4CEE5; Mon,  3 Mar 2025 21:26:36 +0000 (UTC)
Received: from server54.mybundlepay.com (server54.mybundlepay.com [207.231.110.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44324C4CED6
	for <soc@kernel.org>; Mon,  3 Mar 2025 21:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44324C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=mybundlepay.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mybundlepay.com
Received: from mybundlepay.com (unknown [20.57.137.16])
	by server54.mybundlepay.com (Postfix) with ESMTPSA id 3495719E9BB
	for <soc@kernel.org>; Mon,  3 Mar 2025 21:05:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mybundlepay.com;
	s=202411; t=1741035927;
	bh=QieX1f1ZpVBpFqEYiQLHTccw08+B74/nkI53Ml21MeU=;
	h=Reply-To:From:To:Subject:Date:From;
	b=WyDy9xS2JYZU9Bsx0+Sb7PtA9ycq+Tkdft51rFE39ulUNI/ct9EJbsz2uVDDjXT68
	 CVhlugWN4XldJHOod0KMquxd3tHP3021XzgytUW5dOU1GvJVhvjvQrLUGoFRu0z+KU
	 UO97tZbsQH9Sjd98aYS7rIq1egELGGPm1GE7bXfyaeCzGDqnHJU4dottJeEYSL1hcu
	 82adMERUzTWovdXc5lwTlOB9Q7DyfDpYLHcM0iIJFHQSo23TsN7o7AK68XlRw4tpSN
	 rasYF4cx4LVYCLONtg8Rbvl8TW8TiA1CH0y9xC86JSmWjyVTnCQijYvvGjlbCKp5uB
	 Mkrsp++Yt3CWQ==
Reply-To: belliot.panfinconsulting@gmail.com
From: Benjamin Elliot <do-not-reply-us@mybundlepay.com>
To: soc@kernel.org
Subject: INVESTMENT UPDATE
Date: 03 Mar 2025 21:05:26 +0000
Message-ID: <20250303210526.E98BC4EE0C00DD41@mybundlepay.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Dear,

I am  Benjamin Elliot. I am a Financial Consultant. My company=20
represent the investment portfolio of a consortium of investors=20
willing and readily available to fund any sustainable project=20
that can yield a reasonable return on investment. What we do is=20
that, we broker discreet financial services for high net=20
individuals/Companies. We connect you to legitimate portfolio=20
financiers that are willing and readily available to divert funds=20
into sustainable and profitable project or business with a=20
reasonable ROI. Do you have any ongoing project or a startup?=20
Please contact me if you are looking for funds to invest in or=20
expand your project or business. We would be happy to work with=20
you.

Look forward to your response.

Best Regards,
Benjamin Elliot - MD
PAN Financial Consultant
Anna Blamansingel 72, Amsterdam 1102ST, Netherlands.
