Return-Path: <SRS0=KgY5=FQ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8D6C4361B
	for <soc@archiver.kernel.org>; Sat, 12 Dec 2020 02:48:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B84122343E; Sat, 12 Dec 2020 02:48:54 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E9722DFB
	for <soc@kernel.org>; Sat, 12 Dec 2020 02:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E9722DFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qv1-f67.google.com with SMTP id a13so5214858qvv.0
        for <soc@kernel.org>; Fri, 11 Dec 2020 18:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TQduMYVqARw6+qxqGvjM2j3q/xasIzk15UolBcHLkzs=;
        b=lOcZzWTS5jP44Aj5WSnu7Epwi9SIeLpdqG0g7vfXGzHB22bQkXbMPXEOWMrckkpM/q
         8/dGI+MZP9fHvUF4GA8nH3L32jW3q7WD36klvhRf13cEcqlfcQyEM9ypCA+KOXPrrvMA
         uosYL5WdTCiNn5dnUL0xOD6VgodW8s5Ow3BCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TQduMYVqARw6+qxqGvjM2j3q/xasIzk15UolBcHLkzs=;
        b=Nb5ZPxneOlSSGjLOy1IVyqv+OKJ4cPPJ/sUxNqWSOvrOO9hnPFuwhsm1iiPouZ/Qi1
         4tcKkzE+njZgHelD+iVRm7bIfskXOitDG2jF3PVjznjNk171chMyPaMqpxBwhQKxTNir
         V5EbvWgrD4VnH0FL1pyZ08cFJzwVga2Yx9kcOlPE5h7JqAexiK18dWDwhMP1lGbN/iNt
         A2hZ6UtNiioezYBh975vxHW6I0upEVPIXudl3HeO1t2BT1ALin+eRXuONOG2W6nMQpXp
         UAZVxsQKyCifFannTmcZ0qz5sz2nuH+pItYEgIt48HF7uqb0X4JpGYF4lUOorq78Wrlv
         vqZw==
X-Gm-Message-State: AOAM530hHz0IDvcyXet6/MJl0UQ1LaXnZsxxALP1h2Yc0noaSIxsynIv
	X5QhIpWfeas5m9XOOfv1LKiXhJgvx9zmz4PGwNmvPBjSoPdORw==
X-Google-Smtp-Source: ABdhPJwggpEKL14wC5+OproRa+ET7RUsSVcrTd8K7mQPC5vj9AIEfNRFdDaAkFcYA2Eg9tmZEAPR5tj7FGZTJZqZwuM=
X-Received: by 2002:ad4:43ea:: with SMTP id f10mr19617485qvu.52.1607741332882;
 Fri, 11 Dec 2020 18:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201212024643.388335-1-daniel@0x0f.com>
In-Reply-To: <20201212024643.388335-1-daniel@0x0f.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 12 Dec 2020 11:48:42 +0900
Message-ID: <CAFr9PXkz_3VNtQothDPdfhpYBOz_kHqykjftUn7no9yWzVrEnw@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: mstar: Unify common parts of BreadBee boards
 into a dtsi
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

Hi all,

>[PATCH 1/7]

Sorry, this isn't actually a 1/7 it's 1/1. I forgot to fix the subject
before sending.

Thanks,

Daniel
