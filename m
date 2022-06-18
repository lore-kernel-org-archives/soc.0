Return-Path: <SRS0=frgf=WZ=aharai.org.il=wordpress@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4304CC433EF
	for <soc@archiver.kernel.org>; Sat, 18 Jun 2022 03:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11CD5C341C0; Sat, 18 Jun 2022 03:30:54 +0000 (UTC)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 430E8C3411C
	for <soc@kernel.org>; Sat, 18 Jun 2022 03:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 430E8C3411C
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=aharai.org.il
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=aharai.org.il
Received: by mail-yb1-f194.google.com with SMTP id l11so10142113ybu.13
        for <soc@kernel.org>; Fri, 17 Jun 2022 20:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aharai.org.il; s=google;
        h=from:mime-version:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ankteHHF1h867JYGe0JTuOA2V3tLGKIH5w0mJlEel/8=;
        b=Z+G7SBA1WsSK7ulksLz3TgNfJ8IBUB1YVTu5Rmv8PCxMWJmMUprH4fVPhSYM9pkgtr
         79pWsxUtDQsbUS66dbwi6m9wkW8LSiKAVlARXZ1FxHW6jgx68qUknRwDzbZbnJWig66U
         hbo6JuDybHRxcd89Ai+U1NcM6EIQnnlhbQwYWbnCAZUom6ZUpSMsoZDr3eZvRHrsPCQF
         2xolPZVbkR16T43CWzcGg8kvd1ZYM/zlOi2aifrZA2QwZtJXkSafR5erOSqUaAxFua6A
         wMykN7OOkAndxnaaTDdrGfu247AD1K+6JBrVLUr3jr3YCQrf/VIl+BXzCz+9v0YM2c5G
         Vd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ankteHHF1h867JYGe0JTuOA2V3tLGKIH5w0mJlEel/8=;
        b=wpXMUqRuChXJCrQ7tlxhK7MWRDS12/oxowWRZJ3uVAfrTlVSj1XpLfRbHunwv02+Ll
         cle34VqyUNCfLAKkpHduzo42ALEdtk3MuWLmVoE5m6lSaVEyDouHHJX2frb0ydNR6y0v
         LlcY6EWUArNEewh7pJeBo0f1YFFzN2YQoN7wOAREbVXu9CZCYJfUxM2gimkiUj+zZ7WZ
         Lk8pkf33KwfoyEv9N4wa/sTy8+kw2qT3TMgMhJtzTvpTkcAvcibjFH9sZrXnLFe0Cls7
         z5u5ILjNMRc+prRy+7aJMhUtbqTVIPQPZzcIHe5hvtjDx514CbXcn2wwoOsJB5HpMZ7j
         wFHQ==
X-Gm-Message-State: AJIora9wLM5ZoSx1mM7fpW8C1yNkBNzmiJ3VYimCrSGrq33fzX2nvh0A
	tB3G7BTyO9MtOtBKnIvBvvLgHHqRmCdAnNxaso6JOpr5nQlo
X-Google-Smtp-Source: AGRyM1uo13ZUy/Of6BUCJx1/GxhYrJdGjn+PN3iBmr1M1Ph9xYP3KRqcmzXzBuYRPzzEzYbLBNHvhRYKF0Whwe8oHP4=
X-Received: by 2002:a25:901:0:b0:668:c5b1:22c2 with SMTP id
 1-20020a250901000000b00668c5b122c2mr4975902ybj.401.1655523052103; Fri, 17 Jun
 2022 20:30:52 -0700 (PDT)
Received: from 61950379933 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 17 Jun 2022 20:30:51 -0700
From: =?UTF-8?B?15DXqteoINeQ15fXqNeZ15kh?= <wordpress@aharai.org.il>
X-Mailer: WPMailSMTP/Mailer/gmail 2.7.0
MIME-Version: 1.0
Date: Fri, 17 Jun 2022 20:30:51 -0700
Message-ID: <CAH_EgsbtJN0xgLBsV70DUQvyxF1MiXkbjk3czO7_2vQJ3qpX-A@mail.gmail.com>
Subject: =?UTF-8?B?16rXldeT15Qg16LXnCDXpNeg15nXmdeq15og15zXntei16jXmiDXlNeS15nXldehINeV?=
	=?UTF-8?B?15TXlNep157XlCDXqdecINeQ15fXqNeZ15k=?=
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

16nXnNeV150s8J+SnyBHcmFjZSBqdXN0IHZpZXdlZCB5b3VyIHByb2ZpbGUhIENsaWNrIGhlcmU6
DQpodHRwczovL3N3ZWV0a2l0dHkyMi5wYWdlLmxpbmsvZU5oND9mOW80YiDwn5KfICB1Z2Q3azAN
Cteq15XXk9eUINei15wg16TXoNeZ15nXqteaINec157Xoteo15og15TXkteZ15XXoSDXldeU15TX
qdee15Qg16nXnCDXkNeX16jXmdeZIQ0K15DXoNeVINee15DXqdeo15nXnSDXkNeqINen15HXnNeq
INen15XXqNeV16og15TXl9eZ15nXnSDXldeg15nXpteV16gg15DXmdeq15og16fXqdeoINeR15nX
nteZ150g15TXp9eo15XXkdeZ150g15zXlNee16nXmiDXlNeq15TXnNeZ15ouDQrXoNeZ16rXnyDX
nNep15zXldeXINen15XXqNeV16og15fXmdeZ150g15zXm9eq15XXkdeqOiBjdi5hc3Npc3RAYWhh
cmFpLm9yZy5pbA0KDQrXkdeU16bXnNeX15QsDQoh16bXldeV16og15TXkteZ15XXoSDXldeU15TX
qdee15Qg16nXnCDXkNeX16jXmdeZDQo=
