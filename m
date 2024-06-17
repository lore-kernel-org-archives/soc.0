Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A4EC27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 19:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06192C4AF1A; Mon, 17 Jun 2024 19:43:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C6D8C2BD10;
	Mon, 17 Jun 2024 19:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C6D8C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so5989782e87.1;
        Mon, 17 Jun 2024 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718653406; x=1719258206; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD5Y/5f6pQRqkzMC13iInoGdLH5OdYsuoKBoNzgNK0g=;
        b=SJ02fO9gdWj6gY2lq7NxSjkOl2NWSUf4Z6QU6Lge7iA9P3BaFaDBTZM4jHj1HTYYa9
         o0eOUz8QrnFFa2bIzgll2RXX5mlg4IiJvv5RjTgZQ539uPXKYT+5P4Z5DH/yOjvUHTcW
         x53ygpo2zGwcbKOWMz7hNwRL1U+uH/m04NBXrqKazC5q7ygn/CXJCIjLWyLYFYSGKfRx
         NqWZLHh1mvZiU3rmRWHsdTC6jtOEVpnT6JnKjXmRPfmwpFZvh3utUT4dUrl2Ggpfgild
         P0DwNdeNKCdCEhJkXzM0XL8TaVCIAUe6ASRtCzOHQVjdKOmyHpYzNH9hyCx08BiBylG+
         k3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718653406; x=1719258206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zD5Y/5f6pQRqkzMC13iInoGdLH5OdYsuoKBoNzgNK0g=;
        b=RtBfA/sxuQ2yXZbH75guRxTABlrGelQVH8bNw2RuNaPhHvWcKiWEK8NLRNe3JXEYOO
         dkOnqK8o8EYUolnsuFePVM/NmEiDvYioh5qNNvS3CX2pP5mqWLOUtUzN14pjBtRqba/s
         QZ3aRqnSQLBbCONMIkWSaSeEqjf0dFVhyxsDxUac+LIZAVd8d0EB0m5q0oPUs9WybyQU
         bfhyn6VF8cFMqL4urhNwX1t+n7syLvWSnUZqWJa4MvQXUOr8tEsLP2ZckKvQC7MIEEHH
         AyrFxhx1RB7Hj6Oqd5by1dRs24lQcwyJ/XT0vMz+einz3OiIew8yIxblO+0GxbJSm6us
         a6Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU6JX7ZdFgcFo2JnOFLPAI5a1Q86rz9+Hw53MYjXXmOXOTfNKoxoD6nJALUYiApS2RkLeSResnsottT6hOYUn3cn2XVNfagak7HNJhiuO7eBNRgcynwbxdSwW9QGwlgLw==
X-Gm-Message-State: AOJu0YxiLNhklP1OJTdazFdHRn7u7OfZgiBT9pPWLBBz24Z5JdVX2BNa
	UHTVAV+19UT/hB7gsTxCYHJ2BD+gperlEAB4qKk0bba1DswzGEx6T0V6J+X/qx5mEdDlTwLup9j
	MMM+xyybLV8J9A3nA64MsizPm0OfSB2I5
X-Google-Smtp-Source: AGHT+IFzokRQjo5DZuvooHgausO3G6glmv+qQHIsiOfgUDoTBU/nqxCbg9PUd1sVtbhGeSMGFpczWowY2Rmt451jUkI=
X-Received: by 2002:a05:6512:2206:b0:52c:c156:15c5 with SMTP id
 2adb3069b0e04-52cc1561638mr1109952e87.41.1718653405628; Mon, 17 Jun 2024
 12:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240617144532.17385-1-kabel@kernel.org> <20240617144532.17385-2-kabel@kernel.org>
In-Reply-To: <20240617144532.17385-2-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 21:42:49 +0200
Message-ID: <CAHp75VcUgTyQEy1+f9dOrm3Jici1fr5pQ0S5-TkSaounRApX9A@mail.gmail.com>
Subject: Re: [PATCH v3 01/17] firmware: turris-mox-rwtm: Do not complete if
 there are no waiters
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 4:45=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Do not complete the command done completion if there are no waiters.

"command done"

(perhaps in double quotes, since it's a kind of a name)

> This can happen if a wait_for_completion timed out or was interrupted.

wait_for_completion()

...

In case you need a new version, no need to resend because of the above
nit-picks.


--=20
With Best Regards,
Andy Shevchenko
