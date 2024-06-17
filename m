Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85381C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 20:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47011C4AF1A; Mon, 17 Jun 2024 20:27:48 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53A53C2BD10;
	Mon, 17 Jun 2024 20:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53A53C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f85f82ffeso181343466b.0;
        Mon, 17 Jun 2024 13:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718656065; x=1719260865; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr30iqnhMuuS/1Q5pq8lysZKB/O+oTiBfc9id+MeDHc=;
        b=GnmIk1KYvEtanivL4B8yn10FEol34e2dLUazA86VWVaXugK+r17CDMzycg3TH4KL+M
         fJkUzIqTJzIMsK2jVmxev3a35mRle7h4RQfVuHpGx8ZtqEytJMoGqFV6cQ8G1EyJVD84
         74GiKlFSdvotr54u707pDDGDWnA7KMomczl2rEx378MA82ifDcflqK8oM3lFKMJFSjpm
         psy6eoTCm8OBGfkh+1yvx9Z96Jvks8NGUckObCpTwuyveMyfqx91OyXz7OZ1KH9ocUt/
         KQIO8AZn5Wb0TlDw3xgiatNSA+PLxbKUeWgp3WthIMrFXNVQn0lFZ0tQ9Cr8R8++yiot
         epsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718656065; x=1719260865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jr30iqnhMuuS/1Q5pq8lysZKB/O+oTiBfc9id+MeDHc=;
        b=hh/rs4QFERq3fgiymYsj/lxyL7KH/FcX3GBtUF70j4xCTuwEHqJ2t/QYszoQ0wwcUw
         fX/GV5frK2p5BRMHWT8YWXp4gmQDDc+udp7G/QeAXQl7yUfej7UUUCVObejurldiz5OT
         JfBDzntaSbS/N3MWkp1kEA++U9iAYma6Kwj7JtYEOcAJAFSaGtLVlHaojQf+DC2FWXGO
         SlOr8H4W/K1wcrlhX/OcXR4AhYvfACpt7Go9qkW9hj+5gx+JhdxGETq3HH/TTV6cJn4O
         xYiLgPb0QoyNUKpXAC2dFU5i+GVFHrRUhzo+5iGKSPgGEkBqnWskSOxdW7v1dShaVSKQ
         vozA==
X-Forwarded-Encrypted: i=1; AJvYcCUQPwSNtDk9Tn3Bc6WmOCJu9kt3D8BgKAft6ulYpRlAuOkdukrwAaeDWFjmWgWVXZ05beoI327Oe39rf9C4vEM2geNrK8vR5RvGu7FTLoYQS/SXURYMbYYwRAyAw1V45A==
X-Gm-Message-State: AOJu0YzAjkHWaC0nLWDaGa7PISAGIzGEDs2+0PH7zd6PXkSk0Azwp8oB
	6QCM5ebXhhf2AkFYPC2EqUieX0ljx5kVhmlgsig5RyRV10cC5RZxu6qhBbk44pWWOduVPqVOvHY
	mnm5X9aFfQkgwZbz726JWMuspTLKv7qah
X-Google-Smtp-Source: AGHT+IGQ1seTi2I7L9nnOkTetN5ucDTJgL/qa/dP7TES+wr/lEVu72SK8ysQoYI2KzP4jk1VkPDY6Bk4bH8SE66WIf8=
X-Received: by 2002:a17:906:52d3:b0:a6f:22ea:55b6 with SMTP id
 a640c23a62f3a-a6f60de1c64mr730300066b.65.1718656065112; Mon, 17 Jun 2024
 13:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240617144532.17385-1-kabel@kernel.org> <20240617144532.17385-16-kabel@kernel.org>
In-Reply-To: <20240617144532.17385-16-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 22:27:09 +0200
Message-ID: <CAHp75Ve7o-aN+qD1xoN8NvNCou-vdZqmJP_J+kJkmSToGEa78g@mail.gmail.com>
Subject: Re: [PATCH v3 15/17] firmware: turris-mox-rwtm: Use container_of()
 instead of hwrng .priv member
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 4:46=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Use container_of() to get driver private structure from hwnrg structure,
> instead of the hwrng's .priv member, as suggested by Herbert for another
> driver [1].

> [1] https://lore.kernel.org/soc/ZmLhQBdmg613KdET@gondor.apana.org.au/
>

You can make this to be a Link tag.

Link: ...URL... [1]

--=20
With Best Regards,
Andy Shevchenko
