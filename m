Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B61938F23D
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279205; cv=none; b=LEZYpjMqZtntWxnFbCEEYK+fXePVOumRMbjIadeGmX9JDKpoofaw/WcIdr7gRVL1C1rkVOFvVhs+L33I2FPJ3LCoyUV4G2iYXWyYpSJPMm7NE4DZUfDihvmNgO5Eb9edeVVh50yqAwtaBrjaQXPTNdtRbLATRDcaFQOnkE1BgP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279205; c=relaxed/simple;
	bh=UpwgU38+rCIeriFp+dxS1zzFWoXsvHmNXQ2kpnNgNB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tvc+nBrioAqAbX0INeP7e7zl3g6fE0OPnAlRsI8WEqpHx13nyJ6q4LgKRuuzADPJoQHAkoogM5pYa5nKjWT1aJ+QS9UuXL/tgGiBtHiU+btbiAJTBKLEItIrMIbsRMtuYjwdKJXINstWs513yReyFew0YQZylpSdNaM2cfYf3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U+ubbmrN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U+ubbmrN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso236092666b.3
        for <soc@lists.linux.dev>; Fri, 12 Jun 2026 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1781279203; x=1781884003; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mqCQpoV+coXJXQAGZXFgR9yRU+YjO6pTkQa6VIOtRG0=;
        b=U+ubbmrNYx+miNrp13RSQYSO9Lr4liG2IN5EJQG1eed2RMKVVSOHHIraXgTRuEStX0
         rayiJJx//cw0mjYQ4rVcZJeIZl8gum7eeL5p5mEufDiTqPL3tiAEA5kWNlN2SqCzOn4g
         rkDQP3YUFdvpfcMoAFc/JUVcV4nOv9HsdfqtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781279203; x=1781884003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqCQpoV+coXJXQAGZXFgR9yRU+YjO6pTkQa6VIOtRG0=;
        b=qha//OYy5TIBjvQChpgmzFJmN86NwSPi7tVQw+E2CezK9LGMTH8TfnJDY3K1X4ji1B
         WtpvgrKFy5k3EMLwH0NUxsXT+1e1steDq7RqfY60TnzXYTbAMhxKJ+yyCw5S3sJx0+JW
         MPGgPU/Bypt9plGFrWHLA327RsrOJfHybXsROg7mDuQlrxn5kvUIqyhMVj6HZ7GvZORg
         tNyWFLiHr07Qx5dSZpfuvWYrYOWL9nhX/ZSYiiRdMEJgh/jOtoavu36O3NYqRhJCeQoq
         6y4IDMhul0GCugRWOIvOrcwZaNRX/K+OGFmNOA53dKd5dOUhXoqYMSM4b0iosKn4DCbt
         Tt4g==
X-Gm-Message-State: AOJu0Yy25N32gRf1YqzaXIxXxUy1lOVR+w2NOsHmwgq8R3dXiRpd1jq+
	XVNmcpSN/1cnsf0DEFqJ5CRzSi2/roQTGZuIj6LYtgZzxDGoETIyMBL2XY+FvyQx15zo9vbwAqI
	EW30V5G8=
X-Gm-Gg: Acq92OGWOtBMGGZc/0KzharwvuAKNyHXNAPe326mG5jhEPg2raJr6g2iDxH4PKO2Lx0
	YGZRc4zvsu8iuRRQlPz8kIBNVhkG+ojkb46d8UdLcfqyfeCC4wchzVmBUgJyZKG38F0ExFs4hGB
	GHqcEl1A4oTyxrU+nuBeM4kiT7Rsk5tKDSSS9v85p6eQ9Yno2o22eq+9TnhPUATq8IeGw4gtGLp
	3esjoI9RT8yNuuy5v/EAj1s97qIf40SL9e7/cPQuicZOHWZ7VedfUcrhkfAJ6ce766XlIyFM4Kr
	TpeALCIOvdt1ovExR8od6WvLJr7rpRGjErGnMj5qC/0IHvMHzgw30ZEOwi4He8GoUUEqSzI1FyM
	Asa/9gDJshUe8xslt1s7HeIeTNy4g+xsvDX7nQP6B4MDOKDYNrTQSNP6FgjrRXt8xWW8nTp9p+r
	Pb88qby3n/ejwCN4kcQd4GCqk2IEcDyrevvWmbxP+tj+ThpqZIJjO5Bo/95+4UtMjF/NMpmzjV
X-Received: by 2002:a17:907:1c84:b0:bda:8e57:5639 with SMTP id a640c23a62f3a-bfe28a2ebb3mr192085166b.20.1781279202616;
        Fri, 12 Jun 2026 08:46:42 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb522167dsm121451866b.25.2026.06.12.08.46.42
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 08:46:42 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-beb44f97561so153620666b.0
        for <soc@lists.linux.dev>; Fri, 12 Jun 2026 08:46:42 -0700 (PDT)
X-Received: by 2002:a17:907:1c1f:b0:bfe:eda3:f8a0 with SMTP id
 a640c23a62f3a-bfeeda3fb97mr86115666b.52.1781279201920; Fri, 12 Jun 2026
 08:46:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
In-Reply-To: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Jun 2026 08:46:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjXnaYAEmjB=uhh09FQ4J-fjnO2ramtTBiZ4Aa4qqSAHQ@mail.gmail.com>
X-Gm-Features: AVVi8Cc5w9HedteciJuWEiPUV0ypkt7EOCFg1d5H2aaZDK2l3WJ31f_Fy9Dyyhw
Message-ID: <CAHk-=wjXnaYAEmjB=uhh09FQ4J-fjnO2ramtTBiZ4Aa4qqSAHQ@mail.gmail.com>
Subject: Re: [GIT PULL] soc: fixes for 7.3, part 3
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2026 at 00:23, Arnd Bergmann <arnd@arndb.de> wrote:
>
> soc: fixes for 7.3, part 3

Quick, while you're living in the future, send me next week's lotto numbers too.

               Linus
