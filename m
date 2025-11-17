Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CDE2877F1
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372837; cv=none; b=l2gJJUNgwcRwNSx9cN7LEohMA+LSQg5T5fEojJwGyPbarN/9X1yre+RO22xnn644q52B+wlCVOpCqJYgirehI0Luyg7DDmfPqfzKjrD+mbvVXZzIcKDAJwZt66+mT8EdFpFYO26tALrXSxZOnI7trxC+FNo+zDwU0r7Er6+ZzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372837; c=relaxed/simple;
	bh=+0YMguNTagE0IsLyb/xDRjwxwVqW0+dmAXOtxCTVloM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVxav7I14cEJdGcuAXCkRLzs6fykRjDFBUa3n9Uws+cvKJtNPmFKcGNumDdZyNH13O2SF//LoJgFK2kutHzlpGi5s3emc0Ig8ECtQhws81ur3jDwRkwH9batwc/bGnncWAMnfDYnSrMiGkTnCfCmovOo5e91k3GT3rSjzLVdErI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbitLj3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbitLj3I"
Received: by smtp.kernel.org (Postfix)
	id 46AC4C2BCAF; Mon, 17 Nov 2025 09:47:17 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B38BC4CEF5
	for <soc@kernel.org>; Mon, 17 Nov 2025 09:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B38BC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7291af7190so579868366b.3
        for <soc@kernel.org>; Mon, 17 Nov 2025 01:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763372834; x=1763977634; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7YX6kr6+19XslUofmNeGq4cx7X1qn7tZjzeeGnGtGTw=;
        b=xbitLj3IsdpUGup1kUN4s4vHPYKdKNPeztZ2HO9v6UrtuIAGgRMfWfD4aKj7Kb7+P6
         6pTZWgW5+2u2wOyPahMrKqxgTkopqLWD9v3uVZRphAoNxHl1NjRf2pUEcamwyAYkBvE8
         qxMUM/fqVMP5Dg3DojDmPLcykrqWI6IsaIOPe1JulL4wDZccKx38JucAYIvIXPgCbqZM
         NlPFIIOnzyjQAEiAtDswn+fySwTLjbo960V6wonZq2ZPVFhuAO6lYRNRInkuLDIDDLzr
         QyJmWxNmbOEax3kcTqbJLqEVmz44T/WF6qhc5TUQYc7s7OfU7jGNbActAb0XDK2p1p8E
         JMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372834; x=1763977634;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YX6kr6+19XslUofmNeGq4cx7X1qn7tZjzeeGnGtGTw=;
        b=U/4WTGsNCtlBOEIOv4CPDvGqnm3OSPkwUvR1PO7SMvf+r7eSXm6ucgryVMMgUodsOs
         w9/ffZ9FU9xVI94SObiZQNNskMJQi3v0R7YZHFbj0Vk57gO+2GR4FueZI6pdq6Z78war
         5++T6/PDNFcPDTIG+ZOAHU2fSAmjmdxt6LaTmup6dq1fSOVJYLfwpsgBhzhv8KO6LA1T
         4szNgi8OsK219+OfCA0EhZtsI5YEDKB8we747oqVX29n7L7Qms3uXfHp7KhJEfVYyoZT
         FbcNmIo9a7p9vgogJpnqCO4FlI/MqEi47QDh5FUAZGuf4lXGWTwPoetPCuEbW8f1ltN6
         oKng==
X-Forwarded-Encrypted: i=1; AJvYcCUgM44rJ9hmC0cM1MS4rKOx9YoT5fFnuKqNmbJUUd8cEOhKyWpEUY5IJ+Csk8mKuw1fHjI=@kernel.org
X-Gm-Message-State: AOJu0YzCTdXpGXB9cv2A5cTb/tGX3Eev1wts83F2/RqLB6wv6r74nGom
	wRxaoZVE4ViDI5ukraY0fwC1neG/NTCYvlun3wxZGqAogThTf2dCqxb85WrpUJ8tJfFuJGjS4jk
	G7gCa
X-Gm-Gg: ASbGncsdvKBqpdC42wCridJAVbRGOEEEEst+MXziQknCbIWBXnr8uM5ZvX55ctatMyc
	4mdRj2BjFpqRx9iRH3azPCRer6ZJ8u2DTJWuQ+0EZeP9b9gosT1nkHrNOXWYrPDXx2eHFlxZdeP
	UZA0Gh7e1lW8JVFE8URURTT9DakMspahxnwxfYecq8tW/nnvwZto2bjxhncikGjUfiLWMLdhcOo
	EV8LmQNHb2uYQL/bb13Kq7T5c2rtj1GPFp6hP8ZMDWP4V5VYbDiI4TjSViZjzvZey0yTgiBy6hA
	n3hShto05l17nrAvjtDCOivxr9LyEDVL9OZUxj6GDKNWqvRqmcRkPsJs7Fre8FIifV/gkYzDIVX
	lZoHLaPkeUtnmyrbTzLEIfpWpKXVLVdg7IVH4vaByCMRBimFLEe+8DVJucY2Ucd44Pxeg04BWew
	K32X7Xt5sUgVxzuPnCsNMiysEYviWH3sZyXpRqnF5UaSSPAEk=
X-Google-Smtp-Source: AGHT+IF2HhVKUCA/YV7sJ/UAv1rFG5dvGnJkrWqXvb2Eo4NtlDORIZmywkF9DCiaEbJydYdXVpovPQ==
X-Received: by 2002:a17:907:25cb:b0:b49:5103:c0b4 with SMTP id a640c23a62f3a-b736796a66fmr1326019066b.56.1763372834471;
        Mon, 17 Nov 2025 01:47:14 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809d2sm1048448866b.42.2025.11.17.01.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:47:13 -0800 (PST)
Date: Mon, 17 Nov 2025 10:47:12 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] QCOMTEE fixes2 for v6.18
Message-ID: <20251117094712.GA1518418@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these two small fixes for the QCOMTEE driver in the TEE
subsystem.

Thanks,
Jens

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qcomtee-fixes2-for-6.18

for you to fetch changes up to e19d7f7e92e061707252eab2b71d2c3be09b2e96:

  tee: qcomtee: initialize result before use in release worker (2025-11-17 10:19:29 +0100)

----------------------------------------------------------------
QCOMTEE fixes2 for v6.18

- initialize result before use in in error path
- fix uninitialized pointers with free attribute

----------------------------------------------------------------
Ally Heev (1):
      tee: qcomtee: fix uninitialized pointers with free attribute

Amirreza Zarrabi (1):
      tee: qcomtee: initialize result before use in release worker

 drivers/tee/qcomtee/call.c | 2 +-
 drivers/tee/qcomtee/core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
